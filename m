Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FDBCAC5B8
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 14:58:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4Kkw-0007Dv-DA; Thu, 02 Oct 2025 10:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4Kkr-0007CV-VE
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 10:58:03 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4Kkh-0000Ch-HK
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 10:57:59 -0400
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-46e42fa08e4so9901635e9.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Oct 2025 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759417064; x=1760021864; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WoTee1wY/4Z8UrgceMQOy/NZaOImNF83wByOYO4nupE=;
 b=mM0s9g91nzp2DmUZtRCWARsMc1UiH4rDk0ogyS7vsS3xjHMNnLgEOmIKxmPjFpO7Cv
 h+n4E/o6ahIc87sM7Lzk2uN0gs5vCpeQS26npzS9JHMr81Wh6T92/LUmD9URzEgqp3Lp
 56suICfx3RRT4EGmuq35kvMhian/cVuC1cZSb//nRPQ3JGzZr3QXhX7MT1+z8G0pbZHF
 kEJNE9fWYR9V0jb+z44kbIoLFFRQGC73ceVCOXZXSrcYDj/iCkHKp6oE8vnEM775tmUd
 V/jmWhIa6qwG2SVc1GAXlJio7u5BmEkM5aFN9MZH6zEX8slpoCtwC8mOzqTLSNZKZLn8
 179Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759417064; x=1760021864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WoTee1wY/4Z8UrgceMQOy/NZaOImNF83wByOYO4nupE=;
 b=BZ10lYwjgELaH9sYdY+Dqe3eZ+qSzr2cyM9y6jWkK5AZ/0aPVgz13lMIuOKaTYynby
 5zziyUwnh5waviAgLfBuvj+4H+4EcYI6+Vxk+EOEiiebZtg0zgMejFrRx6pniZWuUv52
 47rXW1rPGQPEmvGpyiiZzeCUfSdux7eFtdEvmoja5vewDECygwzPPkirGIQzUrGGh0pz
 I6BRuw2y0AEWTMqHAjYcBN1iXs8g8WU9pwDLS36TaqcPVDZYHr1MSz1CxXstHZDmKcZi
 0sLD/QgPUTDGBgxRU5XOqt1sI/AsDPsl/Wv1ty2zhN/p08sujPLIgV4mfgOI5cwvP+JG
 DjhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWx4dErDallsh3TSKK9odfmrrW5Y/f+CpIX5145EsCUbaIp07LVwH3uwGmoDruNZ2vFsMgE/YEGmlQ@nongnu.org
X-Gm-Message-State: AOJu0Yw88SJbbB18t6yuPCb7+Txe3jDn5Njd8EOTomT9mZGfYCidkEYU
 Amo7F3aOsgtpxF386M0NjsPXhHnfIfUO6BNYfq0OWDeH6dUyUoSe9e6+AiF4lUPbn2ggdjx6s9k
 SzCA/+vqTAmpq
X-Gm-Gg: ASbGncv0iZNBVPcXoItXMraPdOmf+duHfypTyaevMIb+gvW4pKW92/YGdMQmkdiiKCl
 uFV3owh8kLxzf7dPvUfTeVOKlsAP3YPV08zE7vNIsBqnMdV+WPAKk331299hjcf3mRyM7z8+J3A
 EPGIM0u+LEr/zUDlApZP4nfpJlfsIoKFA78DiEOoUCV2DZpNhCW25VCBp+RVsghi0XpFw38VJk+
 qAzLON2f48uDY4U+ywtL3sqW86rqUoy9LeaZgYPPK/ymszlXWCoBsoBOXQLDbrHRB8pXtLswn/J
 SqGv4BX0IsUYjqEYCOtfSz4DeRFm/1TguezIVYPjnSNgAuYeORsbePU7xqCr0JWNpVeUAXn6sPY
 ivnl4QtS5d+WjKyMfnX8yh+XAElJUVHVy1e0yA2X6Xy+7QpMlF5dl7oTfo+kaCgmT5lHjw8L1Us
 tBKPDcbLhLPELDi0s7mT8ReKsA
X-Google-Smtp-Source: AGHT+IHWOX09FU0xZ+bjaszTfnvN7j2gcdt7xzYqHffyTzQkST2hqs52bHwu+grjhQTtk+Hp82G0MQ==
X-Received: by 2002:a05:600c:a404:b0:46e:6339:79d1 with SMTP id
 5b1f17b1804b1-46e63397ae5mr53003735e9.5.1759417063905; 
 Thu, 02 Oct 2025 07:57:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9719sm4121462f8f.31.2025.10.02.07.57.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 07:57:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/6] target: Remove remnant legacy cpu_physical_memory_*()
 calls
Date: Thu,  2 Oct 2025 16:57:35 +0200
Message-ID: <20251002145742.75624-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x343.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The cpu_physical_memory API is legacy (see commit b7ecba0f6f6):

  ``cpu_physical_memory_*``
  ~~~~~~~~~~~~~~~~~~~~~~~~~

  These are convenience functions which are identical to
  ``address_space_*`` but operate specifically on the system address space,
  always pass a ``MEMTXATTRS_UNSPECIFIED`` set of memory attributes and
  ignore whether the memory transaction succeeded or failed.
  For new code they are better avoided:
  ...

After converting the target/s390x [*], this series convert the
remaining targets.

Based-on: <20251001175448.18933-1-philmd@linaro.org>

[*] https://lore.kernel.org/qemu-devel/20251002091132.65703-1-philmd@linaro.org/

Philippe Mathieu-Daudé (6):
  target/i386/monitor: Propagate CPU address space to 'info mem'
    handlers
  target/i386/monitor: Replace legacy cpu_physical_memory_read() calls
  target/riscv/kvm: Replace legacy cpu_physical_memory_read/write()
    calls
  target/riscv/monitor: Replace legacy cpu_physical_memory_read() call
  target/xtensa: Replace legacy cpu_physical_memory_[un]map() calls
  target/sparc: Reduce inclusions of 'exec/cpu-common.h'

 target/sparc/cpu.h          |   1 -
 target/i386/monitor.c       | 134 +++++++++++++++++-------------------
 target/riscv/kvm/kvm-cpu.c  |   6 +-
 target/riscv/monitor.c      |  12 ++--
 target/sparc/helper.c       |   1 +
 target/sparc/int64_helper.c |   1 +
 target/xtensa/xtensa-semi.c |  11 +--
 7 files changed, 86 insertions(+), 80 deletions(-)

-- 
2.51.0


