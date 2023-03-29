Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phc6V-0006F7-U7
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 16:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6U-0006En-IV
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 16:09:06 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6S-0007nO-Rd
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 16:09:06 -0400
Received: by mail-oi1-x235.google.com with SMTP id bj20so12551889oib.3
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 13:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YfNt9a+VvOzDqP6yjzhOP38izmUec3v90DzjLwl4ayI=;
 b=M5BIr0ibSPNnrvjc1iVmQbT7CssENik71DayqW+iqwznodbPFoSgHAdXoqu19M8xyw
 TFlKqk+BAgGqtw9csI0yjTRsAadAAjuMQcdll1MRngjjeWNj1tNQaaKgJsGEwCN66/QC
 Ble3JWiVnI8DK9PBTBOLJ3FgXcCk03JCVqRnLR1q+aD//eNF1qVfXFJJeeGPZ0cRDYQP
 Suw2hlcaLFoP+zjMHs2UCdMFC6elkgSNonvoEns4OHDv/up6y/SY9A0cxY4A4r1op3GI
 0OqpShRMncSCptMaCQdyV/ZiYi6U3tnitq9w7Zn+OMmtg9F7Yc81XxzSCZDKMHcUPdBB
 OuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YfNt9a+VvOzDqP6yjzhOP38izmUec3v90DzjLwl4ayI=;
 b=yxGvp0H4FTCOy5uhSDAERacL0Rbydg+9rbzu/rdIh6vrvd3Qs6gFc8ax26yMKwauhx
 wJIdBS62UwJOUnpi9aNJ9sY18be5QoXhQwIgrG1qQ7s9PqiufsHx0aJMKeir2vuPhGAb
 NukYOwrknxhEoDfGzu+R7eJCIeplJ+IRN4yN4YONNVFE5YjiFfE086rJFCYJ/230T4h7
 sCTpRrSjEWAJxUvYVU4Yw0jgqTRoj0DkNvEibV96eqa+PbZiKCXTWGRH+89AypCZAvna
 58bYyynf9pGX+RghiOx1RuAuGBrtuzR8mWauesNstEGd9tr4ie110QQO5GYB+FH/ZAPr
 K4LA==
X-Gm-Message-State: AO0yUKUH+wuNwOJB+tYGpkStev6MsEBabWbqSIM2gF8Kn+N2p6oikq/e
 D2X92/VG/ILqJoANX2Iq6E8Yyg==
X-Google-Smtp-Source: AK7set/75eiKRFzFQU7+R4F6NsvbD7+rKJDGPewDUXpwHD64CjL/cKs6XN3cZOZ7AcrY105FVz5SEg==
X-Received: by 2002:a05:6808:3cd:b0:387:5e03:5b48 with SMTP id
 o13-20020a05680803cd00b003875e035b48mr7959790oie.55.1680120543476; 
 Wed, 29 Mar 2023 13:09:03 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i206-20020acaead7000000b003874e6dfeefsm8195182oih.37.2023.03.29.13.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:09:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 0/9] target/riscv: rework CPU extensions validation
Date: Wed, 29 Mar 2023 17:08:47 -0300
Message-Id: <20230329200856.658733-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x235.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 20:09:06 -0000

Hi,

This series contains changes proposed by Weiwei Li in v5.

All patches are acked.

Changes from v5:
- patch 9:
  - remove ext_ifencei setting from rv64_thead_c906_cpu_init()
- v5 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06740.html

Daniel Henrique Barboza (9):
  target/riscv/cpu.c: add riscv_cpu_validate_v()
  target/riscv/cpu.c: remove set_vext_version()
  target/riscv/cpu.c: remove set_priv_version()
  target/riscv: add PRIV_VERSION_LATEST
  target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
  target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
  target/riscv/cpu.c: validate extensions before riscv_timer_init()
  target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
  target/riscv: rework write_misa()

 target/riscv/cpu.c | 330 +++++++++++++++++++++++++++------------------
 target/riscv/cpu.h |   3 +
 target/riscv/csr.c |  47 +++----
 3 files changed, 221 insertions(+), 159 deletions(-)

-- 
2.39.2


