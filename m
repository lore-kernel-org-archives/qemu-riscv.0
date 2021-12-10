Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaoo-00075B-4B
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoi-0006h9-Co
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:44 -0500
Received: from [2607:f8b0:4864:20::432] (port=35748
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoc-00070o-GR
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:44 -0500
Received: by mail-pf1-x432.google.com with SMTP id p13so7789837pfw.2
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uIsjdMwkyDNkTA1xD3HW4M8Dry4CCyP3fq54zuGewp8=;
 b=cybmKlX4nayW2ukkLbjU59bOfqneV6eJRSJZkZ6jFs2EwyIAmy7EqA2Gv0skIsYXEJ
 4JIKeg6p5T5Khx1FJ0wx9G4Wh030JoIlNKysnQ7SYX3nVkuKgJEkzaFS2RI/e51KwesZ
 gQKGlkLHBm0uCJLEJ2f+6M5KQqOV4aMpjAKmFppO3siKrVNsQVn0kc4IddYtnUDcM5BA
 /xvsE/dc83R3duE25F8yb37quO6hohbTaWjfBCuliHwvX6qf2+075HTBgwNiukVzJR/n
 6gHFm689H+KLfWfxD5u/dDfpglDLlndWc6jkAOPBjjdFLqnPCKLuAP1ygrZq9RbzloNp
 +s7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uIsjdMwkyDNkTA1xD3HW4M8Dry4CCyP3fq54zuGewp8=;
 b=HlG0N2/7tgJ6dhF2M8TVGkl4ibbcRq90vCeMshcK5yAN3CYTK3NKMoIKedKj8seX0f
 EGR0cw7qo4f8RST267Gr8PcuK54/uaK6Q0wmnrRbhKXMLT0WATrJmYwQenSohE62dCxg
 k3KI/bKDdDP4EwZyWgwAKfBCi45HcYxNvUEIHRtt8CTMAMsPm/7Hh/qBL/T4wYSi/pl0
 Fe3LmuR5ufluUejaM1xBLgX/+XZtltnFfZ4s/LaTvW7IZ21Hhw6dX1wfsO7eg76yWBMg
 92IEsPnFMlRPC+nyUlrvsemaSwxdZkZUo+5Eh1Xp4JqMK98Gr0mpJuAKZjg+dwWioJFO
 zzNw==
X-Gm-Message-State: AOAM531tAh7SySKfgbvq7zWCrAkN95mfB/RpsN7lV20fh3fO1wYSfvr5
 DYt2KOODjZ2sVHpU28E7OeYpGw==
X-Google-Smtp-Source: ABdhPJygmtrQ5N9mUFnWkMszY5MsYAsosesOvUjUvCtq08b/kh/NFMpzoSXNXpLbCNxBNtvbf3YDsQ==
X-Received: by 2002:aa7:8717:0:b0:4a2:967c:96b with SMTP id
 b23-20020aa78717000000b004a2967c096bmr16723894pfo.14.1639123172386; 
 Thu, 09 Dec 2021 23:59:32 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:32 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 46/77] target/riscv: rvv-1.0: single-width saturating add
 and subtract instructions
Date: Fri, 10 Dec 2021 15:56:32 +0800
Message-Id: <20211210075704.23951-47-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:59:44 -0000

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f6202835ff..ed4554b6a1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1999,7 +1999,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
-- 
2.31.1


