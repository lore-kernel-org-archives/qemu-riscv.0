Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A49C02194
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 09:59:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfyf9-0000My-8x; Thu, 06 Feb 2025 04:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tfyf6-00009l-3W
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 04:59:08 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tfyf2-0006JM-BS
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 04:59:07 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2165cb60719so13195345ad.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2025 01:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738835942; x=1739440742;
 darn=nongnu.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uCI4X5t3ctqe+eI91egl8+b7NybtBjs0uaXRxYcMVbo=;
 b=b8S/r/+MZugP/Dp+YtxI3MuLQufNvi1cMDt8SlnwFkRH9paYOaDmnod90iJKxMlIwF
 w8nGhgJWUnGzT0twkCb7lNX6Rlaa4eT4I4wj5lu3lvHlJzBYvpbSns7R8YHZ/hmCiogY
 z3w4CzioVfne/+8sONT5wv66+XGL5cha0KrEvWR9bsk9Y3OG282R3YLpyGk3QpD5Sh/s
 ADClBxJ7R1lIEz54iIdyBi+BH/MoylPAau/E0TEOPOCTBtvf3D5fjkFkT5A62WS6U7bu
 enj6GlvpFCXEOaHoWNJxX6v4nkFWniAMdtngalPcKjLc1iL3IrdrJPrJJB2eVzrS3Ygz
 Us4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738835942; x=1739440742;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uCI4X5t3ctqe+eI91egl8+b7NybtBjs0uaXRxYcMVbo=;
 b=kcmMAHSq1b1ksBd//hfwSeWAjeYFdyktoi7u+ugmAyrWYuvczE/rPwSk9SYiw5Gqfc
 qf8fv7zpk7llCMslQoUigIwajGqyrnTGBCsWS33AHM1nAhcBy/jiCIjBeyQ0VzZiO2h1
 uGYCwJ7etgSkt3qM3k8yUmR/F4t9aHYRL/U70xPRzLle0t0ZNzr/w9Z9upd062qTRrdB
 n7COHWSsz+YjnuOUWuoe8NDu5RKhfJLFgznm9ynyAzrtqIg74MXFwxxeSGQlgKNhmNxS
 La57I3GSqkpnBJFXLOG3xcmi75RJHTiQNbnJgrV6yPLy6xlZ9cB1VvWkgr4Ou0sLYWu4
 ysuQ==
X-Gm-Message-State: AOJu0YzproTHaZ7EeF8AZfMIYal3K8OIo7CmhGYBd0kHQM0h8kpSj8j0
 9Arf1PBdopHRHQKcf01s2Jo3x80brdRuRtb60/9bEQI48mjHNeNgU626BnGWEzc=
X-Gm-Gg: ASbGncts8TKmD9BSu60aV6K8wFXZnKoPlt5/HIrTHPUFcFbrP1eFZG7mY7ZA0YYioya
 cRECGph7Vn+cj9Rt/ixff8Vb9Wa2ZNuUAgfKToZmXPkBJyRqIsw7JEEq0sSY4oiBTSGzcsay7H7
 zHkJcUphThrj3Aqr7RcC6p8m0+CYh5rPxXKDo/7lT4ju047cX+wydgk4PL+0VM1Aw7NqgCr7Gzo
 /4KKIxZEDlFtJr1s4X5Jd73j364jUXpgd/BVPyroyT/hWpjH1FskDuj0+1oizts6a0yKo6xl9Sy
 h8haAuTYXznL7WVrd7RegDi0tElJ
X-Google-Smtp-Source: AGHT+IFo9FQRKiSEr84rYbIzNC1Qr3LX5OCVei9VUzM4nrwgcWGStPhACpZ34LvSjxomGkfXfP8Jqg==
X-Received: by 2002:a17:903:46d0:b0:21e:ffaf:8908 with SMTP id
 d9443c01a7336-21f17ecbd38mr110409025ad.34.1738835942149; 
 Thu, 06 Feb 2025 01:59:02 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f365616ecsm8768815ad.100.2025.02.06.01.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 01:59:01 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/2] Minor mhpmevent related fixes
Date: Thu, 06 Feb 2025 01:58:45 -0800
Message-Id: <20250206-pmu_minor_fixes-v2-0-1bb0f4aeb8b4@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWHpGcC/3WNwQ7CIBBEf6XZsxhYRIkn/8M0TUu3dg+FBpRoG
 v5d7N3jm8mb2SBRZEpwbTaIlDlx8BXw0ICbe/8gwWNlQIlGKmXEury6hX2I3cRvSuLS42BJn42
 lE1RrjbQXVbq3lWdOzxA/+0FWv/T/VlZCCqdRWzvSNEi8Rc4hsXdHFxZoSylfy7JggbEAAAA=
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Here are two small fixes around mhpmevent encoding and reset value.
The first patch is picked from the platform specific event encoding
series[1].

[1] https://lore.kernel.org/qemu-devel/20241009-pmu_event_machine-v1-0-dcbd7a60e3ba@rivosinc.com/

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Replace GENMASK_ULL with MAKE_64BIT_MASK
- Applied RB/AB tags.
- Link to v1: https://lore.kernel.org/r/20250115-pmu_minor_fixes-v1-0-c32388defb02@rivosinc.com

---
Atish Patra (2):
      target/riscv: Fix the hpmevent mask
      target/riscv: Mask out upper sscofpmf bits during validation

 target/riscv/cpu_bits.h | 5 ++---
 target/riscv/pmu.c      | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)
---
base-commit: 3f26a7a370c11c7dff68dabcccc19c4e0de901e4
change-id: 20250115-pmu_minor_fixes-7a2b8e3658e4
--
Regards,
Atish patra


