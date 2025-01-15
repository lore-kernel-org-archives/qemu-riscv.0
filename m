Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D33C02185
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:44:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tY8Mb-00083d-2z; Wed, 15 Jan 2025 13:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY8MZ-00083I-DN
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 13:43:35 -0500
Received: from mail-oa1-x41.google.com ([2001:4860:4864:20::41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY8MX-00036W-Qg
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 13:43:35 -0500
Received: by mail-oa1-x41.google.com with SMTP id
 586e51a60fabf-29f7b5fbc9aso43561fac.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 10:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736966612; x=1737571412; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mVDN4MjaZBTmqIZfmehnZjKJIdM4iScvOXjzGweeZx0=;
 b=lVTRNelIvabPJK3DmtkzoqiHKD8laRv6dpV9k0odwEwT/l0OwVJtw8n+WQUYkug228
 imLEUJDfQiU6jiPPM2EwIY438SR/zf0EB6Np9kdf8X6i2yw0qfwvVSQOCcs6U2AYf0Li
 3OP2GW+a9piXJJWv7a9lxlBzj82CCgepMM1b7E7SwgePeW2fT3l/hf2L+u3LksEtiOZs
 dF3l/10mq2Ujo7abL4NwN3kOorMCd9YUeaw6/TPBQ4oQIJEwqlTn4t48UYwW/v91fsMC
 4pTIAukAWYqzQUv8GjmwYiepJyDui0Cy5ekEKTX7mf8VBmXJsrxnTfRutmdzf8hr/fsS
 109g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736966612; x=1737571412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mVDN4MjaZBTmqIZfmehnZjKJIdM4iScvOXjzGweeZx0=;
 b=ct/rdoujC6E5RuGO535HCmVfj3+3h+ZCSDYVJynUXG28qdUSI4kiCdBjOq1uXfw1m1
 5pb+nYw5b0z/6HlEPg0IOGdV+FvuCvqemsz2YCRNo8/kWoKzztPwasWyb6T166nflfXv
 2pV1k3iEk4txikF9QPSu/i0BJ5zo8oV4nK/k+4czGp0jfBkgXuX9PDSkwT5CY4M4YM9K
 AkwgOolZwz1LG2xEmmUG7B9pVRythgirJEbLWF00IW3moo88HRs0PQQjYH68jl5GlKJs
 2PrkYypqF0zCce0yBidb0lsSDAg+hScmb8Do+qDTEw8dsHgOwgKH1tuH73sIaBlRgZ9+
 Lbzw==
X-Gm-Message-State: AOJu0YzykkJinIa51RkCbqWlmbCzsR6M2oUF4Fz0w/7SZkxcE+Rmp4RR
 bgq/UdBbQC6eI7htgtGSPhHbRgziEyL1SgCXyvbFVklm8ms4TwWe973NEtVy5jY=
X-Gm-Gg: ASbGncvVsTVUOdnqSovhn/YtM7PPFNY/qxAdDMRN/sfi8Z5KKPdPbKb5r5Q7Jt8cpXh
 f44u8Rz3as3L8xBVjf9M/weIbgaXuld79huOFIiVgyCVNWPq3eKKoTjXxw7q4M0uV6nBBeJWtaF
 DglT8jy437eeQUWBua7YdBqplBIh4ajvkYr6ZIL8oLEMOM8JqNKrHziaxxkEhjL3IYB56kii6he
 pAEUU8b4XaT3A/O50WhBvZ+Mh02jCDqmur7y/roX0bdkyrq0BME3VlFFag=
X-Google-Smtp-Source: AGHT+IHKeGwgu56SK4Tq9fOLVnYx3IZ36v6SQwrV5PvisOLeYc/tN22rTiQ4IkejNODPyT60H2Hauw==
X-Received: by 2002:a05:6870:6b0b:b0:29d:c624:7cad with SMTP id
 586e51a60fabf-2aa06668e28mr14826883fac.3.1736966612481; 
 Wed, 15 Jan 2025 10:43:32 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ad80a5cb64sm6539196fac.47.2025.01.15.10.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:43:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 2/6] target/riscv: use RVB in RVA22U64
Date: Wed, 15 Jan 2025 15:43:12 -0300
Message-ID: <20250115184316.2344583-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115184316.2344583-1-dbarboza@ventanamicro.com>
References: <20250115184316.2344583-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::41;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x41.google.com
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

From the time we added RVA22U64 until now the spec didn't declare 'RVB'
as a dependency, using zba/zbb/zbs instead. Since then the RVA22 spec
[1] added the following in the 'RVA22U64 Mandatory Extensions' section:

"B Bit-manipulation instructions

Note: The B extension comprises the Zba, Zbb, and Zbs extensions. At the
time of RVA22U64's ratification, the B extension had not yet been
defined, and so RVA22U64 explicitly mandated Zba, Zbb, and Zbs instead.
Mandating B is equivalent."

It is also equivalent to QEMU (see riscv_cpu_validate_b() in
target/riscv/tcg/tcg-cpu.c).

Finally, RVA23U64 [2] directly mentions RVB as a mandatory extension,
not citing zba/zbb/zbs.

To make it clear that RVA23U64 will extend RVA22U64 (i.e. RVA22 is a
parent of RVA23), use RVB in RVA22U64 as well.

(bios-tables-test change: RVB added to riscv,isa)

[1] https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc#61-rva22u64-profile
[2] https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc#rva23u64-profile

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c                |   2 +-
 tests/data/acpi/riscv64/virt/RHCT | Bin 398 -> 400 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b187ef2e4b..6fb4d5f374 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2351,7 +2351,7 @@ static const PropertyInfo prop_marchid = {
 static RISCVCPUProfile RVA22U64 = {
     .parent = NULL,
     .name = "rva22u64",
-    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
+    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVB | RVU,
     .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
     .satp_mode = RISCV_PROFILE_ATTR_UNUSED,
     .ext_offsets = {
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
index b14ec15e553200760a63aad65586913d31ea2edc..13c8025b868051485be5ba62974a22971a07bc6a 100644
GIT binary patch
delta 53
zcmeBUp1{l%<l!7LfsuiM@#{n`13^7TMg~>JqB1j+%-qDZl;ot1UQ&#clNpsc(ij;S
I3K$s}0ARKZK>z>%

delta 52
zcmbQh+{ern<l!9B$H>6Im@tvcKtP9)kwJyAsLaeHGdD3UC3&N_6yxMHMkS6EMh1pF
HMg|4|IwT82

-- 
2.47.1


