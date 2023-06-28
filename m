Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECE3EB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 21:33:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEcly-0004Ec-2d; Wed, 28 Jun 2023 17:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEclt-0003yB-03
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:32:17 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEclq-0008SV-Hm
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:32:16 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-55e1a9ff9d4so948086eaf.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Jun 2023 14:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687987933; x=1690579933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=imGQQ7L0GTtNlqL9eLugq6Gc+UVTn1H25GOf374yEAA=;
 b=czwnFco12cpmX8owaMXsYrQ7n4aG7fP1EOM19wPRCb6bXHYvsiaz+7/wIkehS9VPye
 hng5L8MSQ5ONJBlHibC88QoGXZPHIpookDIzO0qI6R+wM7+pkv3NbdJe0vo1HbpyRPwz
 OLsCl8Somi0Ve26wpIOq3aHCtoRDO69o4ETQXUJvM6AszRqBn/f55Dx8TDvyR001w1Fb
 qXBlajqKs+jRlmVLkTmamtJj1liytu1jH5pvmXDtJ7VGEt+tDc04eP/nNHbhHT4lXeoZ
 qmbwglgELjFxwEui/rnK89VnuXnFMqOSNTeoq59vVfh7Cs4lX2uGCi4tYsR0/RA5HAWT
 v9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987933; x=1690579933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=imGQQ7L0GTtNlqL9eLugq6Gc+UVTn1H25GOf374yEAA=;
 b=O3/bnDQ7y+dg0maMS4pB1cd+E1neVNN7MZ54mH5miejHXslsW0ZJdIHgBgXIxjDwx5
 W3EE/WflpYvNooqqtzsvERdJ461jTahZq/mRedkwNbuxNsaP373+N3EzaofpgyzrTF3t
 PfMgmBpKnebKj2bHsq9rw/5U3dkSC5+gYA7InAGR4OWPRyBpsC1LbWYu/UGNYoAkCE4k
 ms/xAO8IQiFhmaV3YPUrJnqShLSXvDIsdkFwLpWjUbYtgQ8a2KgCGiuzeH9UG0ZK2Di7
 VZ50AkziqRebnmEmZWl8yJlyZA7ga/LLozmutsoBoFzkFsoezc8RbPzNUFtdTby+Sq0i
 mU8A==
X-Gm-Message-State: AC+VfDzloVQs1XHiwQArG0aFmjBaTKrPkXe1kGf9Mutwzgia/2fR49Tk
 69g9XTINRRIrWGy2uteIuiJhew==
X-Google-Smtp-Source: ACHHUZ4QXnZPKIRcZ1S25170YoSY3NmkrpUUVt7tXki/cGoAu4MrXh88cFz0I0se354wd0Th5eTCbQ==
X-Received: by 2002:a05:6808:2024:b0:39f:f42c:863 with SMTP id
 q36-20020a056808202400b0039ff42c0863mr1798294oiw.6.1687987933420; 
 Wed, 28 Jun 2023 14:32:13 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a4a4511000000b0056084a91c74sm832892ooa.24.2023.06.28.14.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:32:12 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 16/20] target/riscv/cpu.c: remove priv_ver check from
 riscv_isa_string_ext()
Date: Wed, 28 Jun 2023 18:30:29 -0300
Message-ID: <20230628213033.170315-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628213033.170315-1-dbarboza@ventanamicro.com>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
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
index b4a6fd8bab..79c8ffe6b7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2015,8 +2015,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
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


