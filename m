Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVILX-0003hm-PD
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 15:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILW-0003gz-80; Tue, 28 Sep 2021 15:00:54 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILU-0000ss-IN; Tue, 28 Sep 2021 15:00:53 -0400
Received: by mail-ed1-x52d.google.com with SMTP id bd28so25513247edb.9;
 Tue, 28 Sep 2021 12:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5OVWSj9sUkCX1v6cnsRaouH0K3xR+Y3taZ9SLTTRPu0=;
 b=XWFT61t3PalOH34TPLfyZSfHww0+IqfDnho4QXrLxwlCvbgkGOfgiDX3SYDmME0bdQ
 F7XO6f2CloyaqUHQHGVgivc0lZYF838zq2sOlMmlQAK5cT6tOGiEL67gzysejHKpC+CG
 NqeBJwe/gQ0fRmFFOchVP07O++noI/CJu/TN2HOgzHtgCWx+1Naz6pvOYGXp4Z4KpFM1
 GaS0Q4C8/lj5ksTu+7f4b74vJiGxP3XTXOoNAncxxEiGDTsLnBSbpxMGydh6cLxZqr8E
 RoAsjwG569Vr/KFHlywbW1m5NVkkIQpxvFVZRMVerN05a0AaWA1u9GL9+nLQ7NA1jYe3
 sdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5OVWSj9sUkCX1v6cnsRaouH0K3xR+Y3taZ9SLTTRPu0=;
 b=mQBG8Y81M5Wc4mEnq2m8sohcBjqZmR2fNGdaU6c5GZ4aHPKvcHFrXTv656PFc4EUts
 YXuUjKyq/XlKKiIn4XttbqXLzf82I6tasQyCc1Xw2bP6DAAXl01hUMHEmgSteT7WN/Dx
 rewlnZ7cDoCjhEWjoSkfoA8Eq1MgdF/5w899OV8xtto5alcbm8xqXCI9P+SLTa4ZkScR
 On48N2Dg0dXVFnPg6vOjL3u+yDeKTB+Yef+X5webm8L8Qo5KdT1E28COAm4llycYXmdf
 Q0Ti1dgZyrtTUJ/uERgiv0aY5HjLSysjFMNOwjN+42yEmqa+9P3QK0X0bfIC/aNm6es0
 Coqw==
X-Gm-Message-State: AOAM5331i7wf88Z4SGL5iNApg6HMRhW5j0DdV/WsYWl9RQmm2ZlmRQMP
 E97juP+mpVsoppVeBI+e2qI=
X-Google-Smtp-Source: ABdhPJyI8NKmZOl9AWb5UFnblR9VVX+EbuCjidrXpI74h4MvT1IPmKhbVCcrhJLrM50l9K180u8+EA==
X-Received: by 2002:a05:6402:1c8f:: with SMTP id
 cy15mr9367717edb.41.1632855646525; 
 Tue, 28 Sep 2021 12:00:46 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id f10sm4500330edu.70.2021.09.28.12.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 12:00:45 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v12 0/7] RISC-V Pointer Masking implementatio
Date: Tue, 28 Sep 2021 22:00:29 +0300
Message-Id: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 28 Sep 2021 19:00:54 -0000

v11:
Addressed a few style issues Alistair mentioned in the previous review.

If this patch series would be accepted, I think my further attention would be to:
- Support pm for memory operations for RVV
- Add proper csr and support pm for memory operations for Hypervisor mode
- Support address wrapping on unaligned accesses as @Richard mentioned previously

Thanks!

Alexey Baturo (6):
  [RISCV_PM] Add J-extension into RISC-V
  [RISCV_PM] Add CSR defines for RISC-V PM extension
  [RISCV_PM] Support CSRs required for RISC-V PM extension except for
    the h-mode
  [RISCV_PM] Print new PM CSRs in QEMU logs
  [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
    instructions
  [RISCV_PM] Allow experimental J-ext to be turned on

Anatoly Parshintsev (1):
  [RISCV_PM] Implement address masking functions required for RISC-V
    Pointer Masking extension

 target/riscv/cpu.c                      |  31 +++
 target/riscv/cpu.h                      |  33 +++
 target/riscv/cpu_bits.h                 |  96 ++++++++
 target/riscv/csr.c                      | 287 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  46 ++++
 9 files changed, 502 insertions(+)

-- 
2.30.2


