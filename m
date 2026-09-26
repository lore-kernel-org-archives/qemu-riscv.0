Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120E6C98335
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 08:19:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xANbO-0000oS-BI; Sat, 26 Sep 2026 04:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANah-0008N7-07
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:17:04 -0400
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANae-0006s7-7m
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:17:02 -0400
Received: by mail-dy2-x0d.google.com with SMTP id
 5a478bee46e88-3437a48f386so111599eec.3
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 01:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790410618; x=1791015418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cCl7EmMMifN3N+FB2ZvvZtho7z8V+PKCogBoxHLSQOM=;
 b=ewJ3SO1Rgvijo1aJoKbvnzODbCby+SvRcu2Gir5U5946mIdLlWhe489L97BNzCHZv7
 JXpIVTO3A/O/fpsV7jip41BYhlmMPoNOTajUEdPxMd36bR+89nmf7lYf8p076G3/9vuP
 5McLQfRZOFTZIykrAjhmtpLuQPo28lw/43ozdiyYznqSjzEJZHNdFImDv7Gkvw9RTtA1
 z6Aha16hHpWqfeEiBYVJBtSpwFUB6WXZnFAYZE2W8kimHsaC+0VDQVGfHRGSyA60tBW1
 kA7HETCjGwPIosU9LiI5QvwQqxvKNrntggxa01GbB3OkLh8jmkHU9G5wYeoVdMub1kZm
 xOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790410618; x=1791015418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cCl7EmMMifN3N+FB2ZvvZtho7z8V+PKCogBoxHLSQOM=;
 b=jK6BRZkQ1OVcXyWPQFQSCSsN/dKEE+tCpWdLxCKy9In1Yf6IdG+BeKv5PTAXlmxPIE
 oLJsFbXZ0RJiEtBx7u1Cxyvash1hnOjtcSfH84MYsWszcz0yXT4SDoRWnCp/CwAkFT+p
 oiJBRlR46HBoPvB2GD3HufXQLlUnRigxKYfi/OxhdIiDPL06wfs5gRpSm8DF4WjqNjRb
 4e14zCi6vt9UcVTmpNNEJCSKkJyOJD8gveA6kkXgcmouBiijrnXd0VgV4R5YnOXIeDDA
 VY8D/YrznR1YGrqOFmuKOb8H9I873WUDXvEu8e97Oi+5u/2iLOvM0+daX6emVmg5t0d3
 g2tA==
X-Forwarded-Encrypted: i=1;
 AKwUvByVrXShu1TvXwz1asvXu1JxPt3TK2SzsOdjNJssNtgAxBQHY4xmsVM8nEetjrAJvqEkEqC6fPFsEzr5@nongnu.org
X-Gm-Message-State: AFuF++lGvLQ9dLZfZaCYuJkXUAt2F9kx47cge6FOqx5dlezEuMbxtrKv
 v66MfZ6Lfs8W5CjyyOD5cKOdIQ/rwQOzcGKT8tf6ye8QPTj5dF1FIwRs
X-Gm-Gg: AYBFou3kEFVtfo4amiYsM8kxM/SIALdeInOgyPbikNHFYFZTvSnbjRuMPZuEZ6RannU
 JaaPja8fvuPC+gWpJz2ZFFrKl1g7OhFX31s1ii7saIa4Andq6BifBI4yAAywcbaTzUBvkNWfrYY
 A5OFPlNfz34E7KkOi0FXsd5Yw107N46kBlqSYC4sbmNcTOs5riODDLiHSokGLbRehqGUkhogpWK
 hJTxL/PCFXREXS4dPJmjjV5PgY2+VchgqruUTO7pBGJRiVlbrM6rKcH58yXX3YwUjy9u7hsBgDy
 12R0TnHTX6OtHKZ4CDMqA3gEdFMwsmxJCyclxUCRnJzFOebFA0zUBqGEkZc9AbgnioD3Pd94qZB
 JXIzRlqwyOUotIVn+kFTVQsPJy2qaqrV3rSytTPVj5Q7RS0HjDRAVtF3Q4tgybMF2cxfZy9p5hY
 03cRM9D3omELt/n6/BOVGVVvoMF8KYGZt5voCCdzYj/pqwDhKMnFZsRuNdXY83igmABUSKHttGU
 eCrv18wBGT0EY9hTPEYXanuCrQbJHU=
X-Received: by 2002:a05:693c:65cd:b0:33f:3878:8e18 with SMTP id
 5a478bee46e88-3426c6f4d95mr2251214eec.0.1790410617991; 
 Sat, 26 Sep 2026 01:16:57 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34144f4eb9esm11970568eec.19.2026.09.26.01.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 01:16:57 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Song Gao <17746591750@163.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 10/10] machine: match the versioned virt example to arm virt
Date: Sat, 26 Sep 2026 16:15:50 +0800
Message-ID: <20260926081551.29-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926081551.29-1-luoyonggang@gmail.com>
References: <20260926081551.29-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The comment still showed MACHINE_VER_TYPE_NAME("virt") and left out
machine_class_set_name(). Show the arm-virt QOM type, keep the -M name
as virt-<version>, and name the latest helper
DEFINE_VIRT_MACHINE_AS_LATEST.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/hw/core/boards.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/boards.h b/include/hw/core/boards.h
index 851140ad052..8525e1f2288 100644
--- a/include/hw/core/boards.h
+++ b/include/hw/core/boards.h
@@ -474,21 +474,25 @@ struct MachineState {
  * For example, a macro that can be used to define versioned
  * 'virt' machine types would look like:
  *
+ *  #define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("arm-virt")
+ *
  *  #define DEFINE_VIRT_MACHINE_IMPL(latest, ...) \
  *      static void MACHINE_VER_SYM(class_init, virt, __VA_ARGS__)( \
  *          ObjectClass *oc, \
- *          void *data) \
+ *          const void *data) \
  *      { \
  *          MachineClass *mc = MACHINE_CLASS(oc); \
  *          MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
- *          mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " Virtual Machine"; \
+ *          mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " ARM Virtual Machine"; \
  *          MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+ *          machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
  *          if (latest) { \
  *              mc->alias = "virt"; \
  *          } \
  *      } \
- *      static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = { \
- *          .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+ *      static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
+ *      { \
+ *          .name = MACHINE_VER_TYPE_NAME("arm-virt", __VA_ARGS__), \
  *          .parent = TYPE_VIRT_MACHINE, \
  *          .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
  *      }; \
@@ -503,7 +507,7 @@ struct MachineState {
  * whichever scenarios need to be catered for with a machine:
  *
  *  // Normal 2 digit, marked as latest e.g. 'virt-9.0'
- *  #define DEFINE_VIRT_MACHINE_LATEST(major, minor) \
+ *  #define DEFINE_VIRT_MACHINE_AS_LATEST(major, minor) \
  *      DEFINE_VIRT_MACHINE_IMPL(true, major, minor)
  *
  *  // Normal 2 digit e.g. 'virt-9.0'
-- 
2.52.0.windows.1


