Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD87CCD1A7
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 16:14:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBEzp-0004NE-Sy; Tue, 21 Oct 2025 12:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEzp-0004Me-7N
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 12:14:01 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEzn-0001dP-B6
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 12:14:00 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7811a02316bso4031774b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 09:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761063237; x=1761668037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2TCE8SvaITfs8coL27qj39ul3rERe6+OoO3JJ8MTgYA=;
 b=Y5FzF/95HSZz1wL12/d+Rm1CHFIKORbR03DGet8I+o1hPNq0pce/tIRLHc5IBGGi8H
 ym+nXt222+EFdRLBLuKkF3T84Q8nyWAb8oA6KcRPF0CVntOe8uzXykxgb63p4ZWVmQBv
 LUHf0vZ4ioo8Fod8WpF5TsW7ESzi3f91OHqT2QIH1G+gfFPiQ6GCZatE/MF+cYW8fF5y
 FDSrxW13uUOf94sLsCZFGhXqxM0kR2dX3KyUxMteCLTS9Wf+hNI/dt2Erh2PnrTjWjft
 HrGCHrJBEB3PMlZVUUpvdHcRza3YaUqEDa+p6sdZ7xD+Vo9FMtQC0h0omVr5hWlXzNIR
 9pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761063237; x=1761668037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2TCE8SvaITfs8coL27qj39ul3rERe6+OoO3JJ8MTgYA=;
 b=iyqnA8PX9IIjLRepoWAtYkdGtRtPpAHaGeqP2iusEnDhJvxxmWnJtl9+87rdDu5du4
 8TYw3RjaIRbVvBSSHjA8jeQq+4D2zWpKf+NJEyV9SuDgTtTvRNlsDmZZDNeXFcWt6Orz
 jZODfHMn3JmIcu4qOyOzCrIZ1PfhuzIY+WaUsDnpjx3rBxkvaBYpEbUoWAnyi1IX1awq
 Xw9zq1RtN9OTJM7Ax6Q+6j5nGdUUILWZpY/i5FIOWSd5BVKYc6SFYG0Hi0PrR8GI4Bhj
 2pQqQRJS3LltPxkamfs6PIP+Ut403hAgkPydmBJwILuPE7J6XeYc67tt9cLJS7z+zsTM
 Q4eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXglCjGMqVmpiQTblmjy2Hhsz4e18IJSiZ0c9Wv93QDMPx9EDkMaLNMPsXnpNx9iJ4usnTCPBGYfX5F@nongnu.org
X-Gm-Message-State: AOJu0Yz3Q0UHHJdRrRZjXIwxbxZrwceObIeUxr0r5BX8Ha52dU0+zUz/
 6SpD7VLRvvtrPBlWsf8eg9Nh2c/Uag+ExYM0mzjXtx+A+MOxYZqmXVqT+L9pzKkNy/k=
X-Gm-Gg: ASbGncu7bcNfe2MgUXSE0vGAbGmCapAmvWokqLtlz+U30de6bw2Lm8bcsQQcdwMR/kg
 DStgS4sv3GG3zQ3D4LpAIdBUy8fevPjPFwlSCY9yZu4vi8M35TnHzbdla4w3FXkR2m/K6+npy8u
 tM04618JHhRabwut8QHw2xaYdv6akPZoqU93Xo2cRUWnKpecJHe8dUsDNxcbdxHygSkdpux7FHw
 BmXz1b7hHCBv/59B4ZMbYvEs2ZullTzabEXCno4ZKWOAfqGJ4ixd9geej/4xt33tL4+c9mhPhWG
 yDALdJ5ILFPOFRfa9glETumsdfodxfTygDE0+KsVpTFDK8StVVHceJEVQWK9SiPIfaUHe93gZay
 iPK3CTFXdufu7GWI1890uLPHa9e9cLvA9mzUWkLx3OQM0X9u4r3EamJ9aJi/FImUWUPENNnKV4I
 F4HZjPBaLNiCMZtcxns2IN1+ZeUx5/76Lj
X-Google-Smtp-Source: AGHT+IEA5R+f82XyVar/ubEBqZZMWM8CYNx9jQMOmBq14yxF9TVlfPiAIb0+PERnaH4eGAVT1rGM+g==
X-Received: by 2002:a05:6a20:7351:b0:334:912f:acda with SMTP id
 adf61e73a8af0-334a8525d01mr23518065637.23.1761063237325; 
 Tue, 21 Oct 2025 09:13:57 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a23010f7c7sm11731157b3a.54.2025.10.21.09.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 09:13:56 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 12/18] target/riscv: Expose CPU options of WorldGuard
Date: Wed, 22 Oct 2025 00:13:18 +0800
Message-ID: <20251021161325.585278-5-jim.shu@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021155548.584543-1-jim.shu@sifive.com>
References: <20251021155548.584543-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Expose WG CPU extensions (Smwg, Sswg, Smwgd) and WG CPU configs
(mwid, mwidlist).

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 32a9f8a6a4..b8704e7e88 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1380,6 +1380,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
 
+    /* RISC-V WorldGuard v0.4 */
+    MULTI_EXT_CFG_BOOL("x-smwg", ext_smwg, false),
+    MULTI_EXT_CFG_BOOL("x-smwgd", ext_smwgd, false),
+    MULTI_EXT_CFG_BOOL("x-sswg", ext_sswg, false),
+
     { },
 };
 
@@ -2648,6 +2653,9 @@ static const Property riscv_cpu_properties[] = {
      * it with -x and default to 'false'.
      */
     DEFINE_PROP_BOOL("x-misa-w", RISCVCPU, cfg.misa_w, false),
+
+    DEFINE_PROP_UINT32("x-mwid", RISCVCPU, cfg.mwid, UINT32_MAX),
+    DEFINE_PROP_UINT32("x-mwidlist", RISCVCPU, cfg.mwidlist, UINT32_MAX),
 };
 
 static const gchar *riscv_gdb_arch_name(CPUState *cs)
-- 
2.43.0


