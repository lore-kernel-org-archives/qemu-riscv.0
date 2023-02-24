Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVdJj-0001eq-LF
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 14:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJh-0001de-Gw
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:13 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJd-0002eX-MZ
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:13 -0500
Received: by mail-pj1-x1034.google.com with SMTP id y2so31426pjg.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677265266;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lx0M+hYFCHNKkG1Lj780I7YKmL/EVcbXsrThtaMCRAY=;
 b=CTkX6u+66vSsrejTgB0cicEuQVAsuTaOSQDrQCxzr6CFtGHbScaDN/cPlt4hq+7ygW
 HXjydaCh8C7wNiA2tovT7n9obuTnSQJZoLj8L3kYYVLD6CUdisin+CSoUkZElVvjRCCt
 fK2dc9IKcKu8fHP+n/U2jQvsnSXJEe1IR7QugZXqokOfE6xhI1IoRs+erCHTpcAA62LV
 2IeuS1VmaBVm7dLC2FjEAZdw+UAaiiDn2at+cvN8Em2rPN7qwfRVJ+Egk9+vPJki3Ad8
 7+AWsT070LwUqTOXTld33GXXQXrnXtUals3SMH/0xikl/Zi3puRzjaMJbiV74BPgemGY
 xrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677265266;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lx0M+hYFCHNKkG1Lj780I7YKmL/EVcbXsrThtaMCRAY=;
 b=PX5wnf8yfnYMIjlrF90tgTOiTfZHHERkQILpvmaWSahdg+CEoMGgQpzyO0H00ije1A
 FfUwnI7aBCmLUbxIqKSCIOiAV8cG2dESlJwbihcuEfdfmQhNLFqrc4/2vW/PfWoe6YPB
 MteH+Xi5oBOVXDE3Nmk//y400AdYSMp+ukJ2HYnxpR4AzuBJ+/ZqMvnMjdKjb8xI8lH8
 Dio19oupYcbOFNKNtlyfik3yhm/Nfzac9HLPtGrnZyZ8kE/RyHpJH7MTmQklkVRWvlDc
 f7qJcJLEv/UxjjEmpvB5qMcBC+feb/Z5fCDoze9bI69BJOsoNLpnpH+EdA7SZz3K/0yH
 qcLQ==
X-Gm-Message-State: AO0yUKVWd42whk+qNPZIbMYPmt4iEIggwo4Yh51uEHSI1+RPIYLSbB9M
 vwLLA6Qrjnsf7g2DjmrPC5OB8z2pr5sIGc6F
X-Google-Smtp-Source: AK7set9//u48MVdDMl1TVHV+C2astQb6qrt4vaDQDsazPTClPqzkr98MctVZHZkdn2joTxqPx1cQRA==
X-Received: by 2002:a17:90a:192:b0:237:b121:6711 with SMTP id
 18-20020a17090a019200b00237b1216711mr1125210pjc.3.1677265266012; 
 Fri, 24 Feb 2023 11:01:06 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 h1-20020a17090adb8100b002348bfd3799sm1851344pjv.39.2023.02.24.11.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:01:05 -0800 (PST)
Subject: [PULL 5/8] MAINTAINERS: Add some RISC-V reviewers
Date: Fri, 24 Feb 2023 10:59:06 -0800
Message-Id: <20230224185908.32706-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230224185908.32706-1-palmer@rivosinc.com>
References: <20230224185908.32706-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 19:01:13 -0000

From: Alistair Francis <alistair.francis@wdc.com>

This patch adds some active RISC-V members as reviewers to the
MAINTAINERS file.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Acked-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-Id: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..847bc7f131 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -287,6 +287,9 @@ RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
 M: Alistair Francis <alistair.francis@wdc.com>
 M: Bin Meng <bin.meng@windriver.com>
+R: Weiwei Li <liweiwei@iscas.ac.cn>
+R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
+R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: target/riscv/
-- 
2.39.0


