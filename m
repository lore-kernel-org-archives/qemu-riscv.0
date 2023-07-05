Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776B2EB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 21:42:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHAF8-0005Lp-2P; Wed, 05 Jul 2023 17:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAF5-0005Fh-EQ
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:55 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAF3-0001oa-Lc
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:55 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1b06a46e1a9so92387fac.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 14:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688593252; x=1691185252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9xHvxLB9xtcGXjVSbRp4EDf5ah7gB89LgOtfMTIsy9Y=;
 b=FHxGqdONPBfBBfCtM9bvl45lDce+DX48TlyiKZCFCF4w9r9oTeK9fIPttFUrCbXjH+
 QZIXtQb8UwiqbubGHPPGhvKVHwnEs0p28FbyMRpTXAGDt1b6quhicCt3ZA4PzUB8cThd
 yqvrWzxJdG11ubj7GPuCnWV4cK7A1fcQfW35ArwlLKm5p6a1k5mUAP1ClDo2rNjxygHj
 bsZDnDJp/znp890QPJtAnhKuuSXmQIh936Pc2H2Utl2R4WEbpNxVTFboTCw/xts9J71m
 vxvMeCZCDYJAf/RuF3fPS+6K52tEZsRC4fSC06Y5nnyRUqqBJvbOaDYwYaPwiWdzrhPv
 50Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688593252; x=1691185252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9xHvxLB9xtcGXjVSbRp4EDf5ah7gB89LgOtfMTIsy9Y=;
 b=iGnafwcodV8L63TJ3kP870br3AEGqMKjC1nGgJuNQsxIzQwODwXSTWbUxZUCi1QekW
 V/7PJY1xWfXPVIIJt8JU9tcrthfd7fXOksN4hz2QxWBIsZkoiJXpNn9h1AHSL7133Ih8
 NxHH8hXZ8FPohGOAhYIXbd60CtoQV9PUljK8qzGx4rRkrwuLBHeIdG0OTuz5fPIfXavV
 0Lw5meb2DDHY+WQEDi73xgI0wnwGjK8pTZwi/eaUfCPr3twJUXAok2ZoGUItHap0XvOv
 WrTRCVisO9sD5IcXbRtZAHjfghgXQoAh3ksRtFHjzpKdq+pYXQYEOJ3jinurRKPvYGl9
 O81A==
X-Gm-Message-State: ABy/qLYKZrOjTXQiU/9Wp/JoN9hmwQ+B6PQxaejnYWqVyspzSi07tSAs
 LLFy3XoaTRhwhjoPkLOrFHbwlw==
X-Google-Smtp-Source: APBJJlHotOge/O/Ts+61rUQCZmOV4erexUmjMqM2dJZ+Ih+sJWPetXhZgkZG4eqYQvTvmPzl0sSdpA==
X-Received: by 2002:a05:6871:693:b0:1b0:6f69:89ab with SMTP id
 l19-20020a056871069300b001b06f6989abmr217528oao.46.1688593252499; 
 Wed, 05 Jul 2023 14:40:52 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a4add01000000b0056665a16536sm70764oou.30.2023.07.05.14.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 14:40:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 16/20] target/riscv/cpu.c: remove priv_ver check from
 riscv_isa_string_ext()
Date: Wed,  5 Jul 2023 18:39:51 -0300
Message-ID: <20230705213955.429895-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705213955.429895-1-dbarboza@ventanamicro.com>
References: <20230705213955.429895-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

riscv_isa_string_ext() is being used by riscv_isa_string(), which is
then used by boards to retrieve the 'riscv,isa' string to be written in
the FDT. All this happens after riscv_cpu_realize(), meaning that we're
already past riscv_cpu_validate_set_extensions() and, more important,
riscv_cpu_disable_priv_spec_isa_exts().

This means that all extensions that needed to be disabled due to
priv_spec mismatch are already disabled. Checking this again during
riscv_isa_string_ext() is unneeded. Remove it.

As a bonus, riscv_isa_string_ext() can now be used with the 'host'
KVM-only CPU type since it doesn't have a env->priv_ver assigned and it
would fail this check for no good reason.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index deb3c0f035..2acf77949f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2124,8 +2124,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
-            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.41.0


