Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6C1CCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:51:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7FOZ-0003tu-7B; Fri, 10 Oct 2025 11:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FOW-0003td-R6
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:00 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FOP-00026s-PA
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:50:59 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e42fa08e4so22076895e9.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 08:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760111447; x=1760716247; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rOoyfTQNfeXt4VFRkzKIh3cZAw4EXxDHAXBHc0WfkpA=;
 b=LH/ngjtNNhg5TZhKNRbz0nw5PkIuKYnyRGtrMdhqD5I8uHQ2Z+h5x61WkbVw4MZVZQ
 dp2oHwpU6jyOSZbExKEXXUmnOtQVJ81FuPp2YulhdISc5uBB20DqYEakyuF2pQXKya1N
 vM+2vhlhsgQQVkg7acsfDHNkEIivYr4SyJalDHjrymp5PHLEeZxw6YErX4eBgVmpu/+9
 ImdqnR+9XZSy4uYPzhmBLX9kohFF6JFoLeEADYRqtNlrISkhvs9k/vx1JGq961mecQX0
 y8RBajltv29Sxn2022fZoewrd931vpWL2gh5BaPf+tnn/tYS8QIC3Qgo483tXbZVQUFn
 xq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760111447; x=1760716247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rOoyfTQNfeXt4VFRkzKIh3cZAw4EXxDHAXBHc0WfkpA=;
 b=v1VP6lar5ef8o8lFGt0oMqarmAEUlPQzsuPwNK2XOKtkcbsNGZsSmuPT6Kx8TT4dP+
 1RGcwh46OczDfkYT5iOro0O6YbBLBWYPIMs9VTNZZmeGeymZ6IFsfXQ3j5e8Ci0ggEDs
 WtcN5Iv0wSTFZBz0KjluuTMfSTwuJPzmL2peqWzz6SVMkAK79ROJ+sABeOlsbjrUTIqd
 FP0TEi8kMqWyXmYQ4G6kRd78mQMoDiudOuftkFKUx8pvNb98LMMshBwDe73fvc8Fq73Z
 f36p/X/1Y6DfdhARJVp8W+T0aOEi/vxMjxESssxSE//eZga45zdHc2IprgD4lXnqC8R7
 A9xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaSaP82U7C3ku6deDx88Vxkxb9xKopeW+VgwQOdwtSiwK2XN5o1XyI7Jm51LjVs12pa3lwLxruHOic@nongnu.org
X-Gm-Message-State: AOJu0YxKl+Xss/AdnTGP5SwkwH1rlhJq6GB8Y1nVgZqI32GWbon1zQ8s
 wzCCTSbAxPAXVFUbFwN7SC56yNFTALBdYy7uQ2caG5PoHDCk5vnyt+w2MA02VG4TBoA=
X-Gm-Gg: ASbGncvti0P51k6aexE29/OM6VfGA89Hdn67SHKwflVrMAm3njz9jZZxFxEpkmLstLb
 WO2gbwGsl51r0CioZEre6m9bcMPQ7N/Ye2PQOmgpssGSQ242Dkcj7kW9hSnYk6D4beoCs4+RmDX
 nf+8pHEITPcC3ptESCajkSgxqKWRCHqw24+mgq/QF4bqDHqHxao24FJXs6fInSLr1l2bGLa+dko
 3qMJAUcLecuyJwUFXoadU3CTrUm4A4EqVULMTnp7m70G1pICdSYwDveC53xZqp62HCeuMmmp7JQ
 KqwIIuDkNKIwTiPZ2LT47jgPH5di6crxwytHODblbkw6vOr+JAjXvLAhcydn13UBF+1QUUawA9S
 E02sZ7SqWYJ/NaV/V6Y5feFt3WYljaTQigaHCarPCZ8tLH+joDMEQevJ0OBz6xY6CjzqZUJ+8Kv
 3a932bFfnfqk884SSbE68=
X-Google-Smtp-Source: AGHT+IF3KSjdLJohDZub0ei+ZVKsAV0c0OxokorXtitMsmb4VGgyyUNb5XdgvB8Lm7V7D0cAsnbyZQ==
X-Received: by 2002:a05:600c:4750:b0:45f:28d2:bd38 with SMTP id
 5b1f17b1804b1-46fa9af3095mr89767745e9.18.1760111447430; 
 Fri, 10 Oct 2025 08:50:47 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb483bbb4sm52096375e9.5.2025.10.10.08.50.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 08:50:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/13] target/riscv: Centralize MO_TE uses in a pair of helpers
Date: Fri, 10 Oct 2025 17:50:31 +0200
Message-ID: <20251010155045.78220-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

In preparation of having RISC-V cores changing their endianness
at runtime, centralize the MO_TE uses to a pair of methods.

Except the 128-bit LD/ST change (first patch), no further
functional changes intended.

Philippe Mathieu-Daudé (13):
  target/riscv: Really use little endianness for 128-bit loads/stores
  target/riscv: Explode MO_TExx -> MO_TE | MO_xx
  target/riscv: Conceal MO_TE within gen_amo()
  target/riscv: Conceal MO_TE within gen_inc()
  target/riscv: Conceal MO_TE within gen_load() / gen_store()
  target/riscv: Conceal MO_TE within gen_load_idx() / gen_store_idx()
  target/riscv: Conceal MO_TE within gen_fload_idx() / gen_fstore_idx()
  target/riscv: Conceal MO_TE within gen_storepair_tl()
  target/riscv: Conceal MO_TE within gen_cmpxchg*()
  target/riscv: Conceal MO_TE|MO_ALIGN within gen_lr() / gen_sc()
  target/riscv: Factor MemOp variable out when MO_TE is set
  target/riscv: Introduce mo_endian() helper
  target/riscv: Introduce mo_endian_env() helper

 target/riscv/op_helper.c                      | 28 ++++--
 target/riscv/translate.c                      | 16 ++-
 target/riscv/insn_trans/trans_rva.c.inc       | 50 +++++-----
 target/riscv/insn_trans/trans_rvd.c.inc       |  6 +-
 target/riscv/insn_trans/trans_rvf.c.inc       |  6 +-
 target/riscv/insn_trans/trans_rvi.c.inc       | 36 ++++---
 target/riscv/insn_trans/trans_rvzabha.c.inc   | 20 ++--
 target/riscv/insn_trans/trans_rvzacas.c.inc   | 12 ++-
 target/riscv/insn_trans/trans_rvzce.c.inc     | 12 ++-
 target/riscv/insn_trans/trans_rvzfh.c.inc     |  8 +-
 target/riscv/insn_trans/trans_rvzicfiss.c.inc | 10 +-
 target/riscv/insn_trans/trans_xthead.c.inc    | 98 ++++++++++---------
 12 files changed, 181 insertions(+), 121 deletions(-)

-- 
2.51.0


