/*
 * Copyright (c) 2019-2023 OE Technology (Shenzhen) Co., Ltd. All Rights Reserved.
 * Copyright (c) 2019-2023 偶忆科技（深圳）有限公司. All Rights Reserved.
 */

class LoginSuccess {
  final String loginId;
  LoginSuccess(this.loginId);
}

class LogoutSuccess {
  final String loginId;
  LogoutSuccess(this.loginId);
}

class TokenRefreshed {
  final String loginId;
  TokenRefreshed(this.loginId);
}

class TokenExpired {
  final String loginId;
  TokenExpired(this.loginId);
}

class UserInfoUpdated {
  final String userId;
  UserInfoUpdated(this.userId);
}

class UserAvatarUpdated {
  final String userId;
  UserAvatarUpdated(this.userId);
}