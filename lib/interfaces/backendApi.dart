class ApiBackend {
  String? currentProject;
  List<TotalProjects>? totalProjects;

  ApiBackend({this.currentProject, this.totalProjects});

  ApiBackend.fromJson(Map<String, dynamic> json) {
    currentProject = json['currentProject'];
    if (json['totalProjects'] != null) {
      totalProjects = <TotalProjects>[];
      json['totalProjects'].forEach((v) {
        totalProjects!.add(new TotalProjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentProject'] = this.currentProject;
    if (this.totalProjects != null) {
      data['totalProjects'] =
          this.totalProjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalProjects {
  String? title;
  String? description;
  String? github;
  String? thumbnail;

  TotalProjects({this.title, this.description, this.github, this.thumbnail});

  TotalProjects.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    github = json['github'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['github'] = this.github;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
