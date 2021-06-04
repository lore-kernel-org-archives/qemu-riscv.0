Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lpC8e-00036w-Ag
	for mharc-qemu-riscv@gnu.org; Fri, 04 Jun 2021 11:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8c-0002zn-Fe
 for qemu-riscv@nongnu.org; Fri, 04 Jun 2021 11:53:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8Z-00006Z-GR
 for qemu-riscv@nongnu.org; Fri, 04 Jun 2021 11:53:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id a11so7917068wrt.13
 for <qemu-riscv@nongnu.org>; Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bGZvEWP0B7XQQEsHoRPrpycuhOjRaiqhP5MCalZexp8=;
 b=WXrKnXghbHEvw8Vgiq01+e7x8S36P2nbON4QAdKLwgJKvKlXFLZL2t966Npejniae1
 kmgtm8uPNGRTwLthfl+0SYlhYwqJ+PI8bI2QsGTUQodygLZHtFTJwsm5wMAXUEx4zKQV
 k39dJMQ7hLKZ+DAbpot18+mGaLE2QViRkqFgWIUXDqFNMw7861ZL4OtZNqGR6khhc0EA
 iR5wqCSgX/Hcefcczp7oVSQBjHODyHzSf/Cnfz+oIODZB9yB0GbGKd+H+A5Us597HxLm
 nlBc6yAyrRjGezhaxh6rRXmL/aCBRz1Slqtq35LlPbThTgqAv/oyZkM080QC9TnX7lnW
 3/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bGZvEWP0B7XQQEsHoRPrpycuhOjRaiqhP5MCalZexp8=;
 b=Zp7duNrpPYWOI27+MRI5NVAa57mpKB11T2TCoubEsVXnzItNuSsKXaxZ0RHBTX6JvR
 QwPKMU5Mr//hTz/oGHfxrNdssFOsr9UQQ597VUlmM1MveE0ayiiIsccFor+vuAO3q4IT
 lhxQ4/7FfbykbzJzbz/aPIBLiCyp4zf8WtEvTr0i8+CH1ExTHdTMGUmhajJs1oerOUag
 iSwUnGgeIOvwD1zv6KhYm4tERjSMjx26wXlYk0gFnKH/lF472+MDWySUfsqANtgcdKN8
 ksZfmF73h9+vsUSaQs+aSW0ScXGWAdeDlgoNYVAioPtUfhanKGIN0abMJxyBiwd9g7cT
 bmtw==
X-Gm-Message-State: AOAM533bwrxCYKVKCluuusqp+XWko906b6GJjogw1b1YYejhMOqY96Ah
 yj9L3WDpXEJQOz1hGFbwFlGktQ==
X-Google-Smtp-Source: ABdhPJzWNcfOAbmTA2OrWC8c4VzflEkQqWUYnBHLnE3cP+gxprJXVyBjUmPrSNOIvrS6qB5vw7NDBQ==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr4706349wrv.109.1622822010020; 
 Fri, 04 Jun 2021 08:53:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g11sm6873579wri.59.2021.06.04.08.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A88F91FF9C;
 Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH  v16 13/99] meson: add target_user_arch
Date: Fri,  4 Jun 2021 16:51:46 +0100
Message-Id: <20210604155312.15902-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jun 2021 15:53:34 -0000

From: Claudio Fontana <cfontana@suse.de>

the lack of target_user_arch makes it hard to fully leverage the
build system in order to separate user code from sysemu code.

Provide it, so that we can avoid the proliferation of #ifdef
in target code.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
[claudio: added changes for new target hexagon]
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v15
  - remove duplicate ss.source_set for mips
---
 target/alpha/meson.build      | 3 +++
 target/arm/meson.build        | 2 ++
 target/cris/meson.build       | 3 +++
 target/hexagon/meson.build    | 3 +++
 target/hppa/meson.build       | 3 +++
 target/m68k/meson.build       | 3 +++
 target/microblaze/meson.build | 3 +++
 target/nios2/meson.build      | 3 +++
 target/openrisc/meson.build   | 3 +++
 target/ppc/meson.build        | 3 +++
 target/riscv/meson.build      | 3 +++
 target/s390x/meson.build      | 3 +++
 target/sh4/meson.build        | 3 +++
 target/sparc/meson.build      | 3 +++
 target/tricore/meson.build    | 3 +++
 target/xtensa/meson.build     | 3 +++
 16 files changed, 47 insertions(+)

diff --git a/target/alpha/meson.build b/target/alpha/meson.build
index 1aec55abb4..1b0555d3ee 100644
--- a/target/alpha/meson.build
+++ b/target/alpha/meson.build
@@ -14,5 +14,8 @@ alpha_ss.add(files(
 alpha_softmmu_ss = ss.source_set()
 alpha_softmmu_ss.add(files('machine.c'))
 
+alpha_user_ss = ss.source_set()
+
 target_arch += {'alpha': alpha_ss}
 target_softmmu_arch += {'alpha': alpha_softmmu_ss}
+target_user_arch += {'alpha': alpha_user_ss}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 5bfaf43b50..6106d24665 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -56,6 +56,8 @@ arm_softmmu_ss.add(files(
   'monitor.c',
   'psci.c',
 ))
+arm_user_ss = ss.source_set()
 
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
+target_user_arch += {'arm': arm_user_ss}
diff --git a/target/cris/meson.build b/target/cris/meson.build
index 67c3793c85..7fd81e0348 100644
--- a/target/cris/meson.build
+++ b/target/cris/meson.build
@@ -10,5 +10,8 @@ cris_ss.add(files(
 cris_softmmu_ss = ss.source_set()
 cris_softmmu_ss.add(files('mmu.c', 'machine.c'))
 
+cris_user_ss = ss.source_set()
+
 target_arch += {'cris': cris_ss}
 target_softmmu_arch += {'cris': cris_softmmu_ss}
+target_user_arch += {'cris': cris_user_ss}
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 6fd9360b74..fe232810ab 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -175,4 +175,7 @@ hexagon_ss.add(files(
     'fma_emu.c',
 ))
 
+hexagon_user_ss = ss.source_set()
+
 target_arch += {'hexagon': hexagon_ss}
+target_user_arch += {'hexagon': hexagon_user_ss}
diff --git a/target/hppa/meson.build b/target/hppa/meson.build
index 8a7ff82efc..85ad314671 100644
--- a/target/hppa/meson.build
+++ b/target/hppa/meson.build
@@ -15,5 +15,8 @@ hppa_ss.add(files(
 hppa_softmmu_ss = ss.source_set()
 hppa_softmmu_ss.add(files('machine.c'))
 
+hppa_user_ss = ss.source_set()
+
 target_arch += {'hppa': hppa_ss}
 target_softmmu_arch += {'hppa': hppa_softmmu_ss}
+target_user_arch += {'hppa': hppa_user_ss}
diff --git a/target/m68k/meson.build b/target/m68k/meson.build
index 05cd9fbd1e..b507682684 100644
--- a/target/m68k/meson.build
+++ b/target/m68k/meson.build
@@ -13,5 +13,8 @@ m68k_ss.add(files(
 m68k_softmmu_ss = ss.source_set()
 m68k_softmmu_ss.add(files('monitor.c'))
 
+m68k_user_ss = ss.source_set()
+
 target_arch += {'m68k': m68k_ss}
 target_softmmu_arch += {'m68k': m68k_softmmu_ss}
+target_user_arch += {'m68k': m68k_user_ss}
diff --git a/target/microblaze/meson.build b/target/microblaze/meson.build
index 05ee0ec163..52d8fcb0a3 100644
--- a/target/microblaze/meson.build
+++ b/target/microblaze/meson.build
@@ -16,5 +16,8 @@ microblaze_softmmu_ss.add(files(
   'machine.c',
 ))
 
+microblaze_user_ss = ss.source_set()
+
 target_arch += {'microblaze': microblaze_ss}
 target_softmmu_arch += {'microblaze': microblaze_softmmu_ss}
+target_user_arch += {'microblaze': microblaze_user_ss}
diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index e643917db1..00367056fa 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -11,5 +11,8 @@ nios2_ss.add(files(
 nios2_softmmu_ss = ss.source_set()
 nios2_softmmu_ss.add(files('monitor.c'))
 
+nios2_user_ss = ss.source_set()
+
 target_arch += {'nios2': nios2_ss}
 target_softmmu_arch += {'nios2': nios2_softmmu_ss}
+target_user_arch += {'nios2': nios2_user_ss}
diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
index 9774a58306..794a9e8161 100644
--- a/target/openrisc/meson.build
+++ b/target/openrisc/meson.build
@@ -19,5 +19,8 @@ openrisc_ss.add(files(
 openrisc_softmmu_ss = ss.source_set()
 openrisc_softmmu_ss.add(files('machine.c'))
 
+openrisc_user_ss = ss.source_set()
+
 target_arch += {'openrisc': openrisc_ss}
 target_softmmu_arch += {'openrisc': openrisc_softmmu_ss}
+target_user_arch += {'openrisc': openrisc_user_ss}
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index a4f18ff414..0afaea25dd 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -51,5 +51,8 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
   'mmu-radix64.c',
 ))
 
+ppc_user_ss = ss.source_set()
+
 target_arch += {'ppc': ppc_ss}
 target_softmmu_arch += {'ppc': ppc_softmmu_ss}
+target_user_arch += {'ppc': ppc_user_ss}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index af6c3416b7..673b35b175 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -27,5 +27,8 @@ riscv_softmmu_ss.add(files(
   'machine.c'
 ))
 
+riscv_user_ss = ss.source_set()
+
 target_arch += {'riscv': riscv_ss}
 target_softmmu_arch += {'riscv': riscv_softmmu_ss}
+target_user_arch += {'riscv': riscv_user_ss}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index c42eadb7d2..1219f64112 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -58,5 +58,8 @@ if host_machine.cpu_family() == 's390x' and cc.has_link_argument('-Wl,--s390-pgs
                        if_true: declare_dependency(link_args: ['-Wl,--s390-pgste']))
 endif
 
+s390x_user_ss = ss.source_set()
+
 target_arch += {'s390x': s390x_ss}
 target_softmmu_arch += {'s390x': s390x_softmmu_ss}
+target_user_arch += {'s390x': s390x_user_ss}
diff --git a/target/sh4/meson.build b/target/sh4/meson.build
index 56a57576da..5a05729bc1 100644
--- a/target/sh4/meson.build
+++ b/target/sh4/meson.build
@@ -10,5 +10,8 @@ sh4_ss.add(files(
 sh4_softmmu_ss = ss.source_set()
 sh4_softmmu_ss.add(files('monitor.c'))
 
+sh4_user_ss = ss.source_set()
+
 target_arch += {'sh4': sh4_ss}
 target_softmmu_arch += {'sh4': sh4_softmmu_ss}
+target_user_arch += {'sh4': sh4_user_ss}
diff --git a/target/sparc/meson.build b/target/sparc/meson.build
index a3638b9503..cc77a77064 100644
--- a/target/sparc/meson.build
+++ b/target/sparc/meson.build
@@ -19,5 +19,8 @@ sparc_softmmu_ss.add(files(
   'monitor.c',
 ))
 
+sparc_user_ss = ss.source_set()
+
 target_arch += {'sparc': sparc_ss}
 target_softmmu_arch += {'sparc': sparc_softmmu_ss}
+target_user_arch += {'sparc': sparc_user_ss}
diff --git a/target/tricore/meson.build b/target/tricore/meson.build
index 0ccc829517..7086ae1a22 100644
--- a/target/tricore/meson.build
+++ b/target/tricore/meson.build
@@ -11,5 +11,8 @@ tricore_ss.add(zlib)
 
 tricore_softmmu_ss = ss.source_set()
 
+tricore_user_ss = ss.source_set()
+
 target_arch += {'tricore': tricore_ss}
 target_softmmu_arch += {'tricore': tricore_softmmu_ss}
+target_user_arch += {'tricore': tricore_user_ss}
diff --git a/target/xtensa/meson.build b/target/xtensa/meson.build
index 7c4efa6c62..ade555ae36 100644
--- a/target/xtensa/meson.build
+++ b/target/xtensa/meson.build
@@ -23,5 +23,8 @@ xtensa_softmmu_ss.add(files(
   'xtensa-semi.c',
 ))
 
+xtensa_user_ss = ss.source_set()
+
 target_arch += {'xtensa': xtensa_ss}
 target_softmmu_arch += {'xtensa': xtensa_softmmu_ss}
+target_user_arch += {'xtensa': xtensa_user_ss}
-- 
2.20.1


