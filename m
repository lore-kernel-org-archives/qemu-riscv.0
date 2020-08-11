Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5Q8P-0003v2-GB
	for mharc-qemu-riscv@gnu.org; Tue, 11 Aug 2020 04:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k5Q8O-0003so-Kk
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2020 04:59:52 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k5Q8M-0005T9-So
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2020 04:59:52 -0400
Received: by mail-pg1-x52a.google.com with SMTP id o5so6410442pgb.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2020 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=8Oa1NMTa30y2wMEwqzgmHnRPPsrYFPcBXMzRuwI3Bf4=;
 b=NbAQ3rFaLfb2y2xQf+774lG4hxAqAVBoBqUlOZ3T5aHP5hhX4SSclXz3ztQzR+p1ob
 JHjent55JjqoDIJHMyr74SGCdc8YTozabS2HKV/bHZ9vCtxMJmWsGAmmlc9+WYdDnCQk
 qUGRj/mNliqw4YRhMgln/vCj8TPBwPeOBLk8vGVLgnTS3+7amGrEHc/esTKR8nPkZKsx
 53BZUkM9XZ+GwMMNKwmyp2bmYWMcwxkHd17UVBGzIMI+MyW92GbtedgSVhra0wSEdqbA
 SrXlWZddYCgZd896zYDu7RHydx4SQj3X7kMg3RwlPqWJSU2jb1zDImjB8roRgf5U4lkC
 AlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8Oa1NMTa30y2wMEwqzgmHnRPPsrYFPcBXMzRuwI3Bf4=;
 b=WNjBtDgbr9sdZ8UM3hGZqumsenTttAl+lc2iqZB3NwxxtAIrznyCHmEA0O74zIae9r
 0bqTDS23O8plQmPlRWgYFdUiP6Vk9E57gb1s9hkggs7Fc3EG6LM8lXLnkISSzrZZr7SG
 th4e+QEaDanaH1ARY+yU1CCeuulYTymiV4mO2w40/sfzSi/KDwBsU3s8814cV3Zam9mK
 AkrrDOMy9HFn6ZTeqJ3SUt87zVSjbXGRFPeIjZJ7Zq+HS9eVEq8ZHVUbTdgGeCLGBfbF
 jNACmDatYBsHngWyStblYtDOUq8BaB1W2n50R3GNirAzv9vsxAwfLOm3J8wF+UqYl7AN
 Z+xA==
X-Gm-Message-State: AOAM531kxGw8PI0gCqrQKNRdU+kCSiTW9i68OVRkwSmZahqV4YtkPTA8
 iT7DBPFvkzOxgCyhJq1SfQ9eiQ==
X-Google-Smtp-Source: ABdhPJxYXlTrwuFJGx6EvTr0dN6ILxLk9QtWXCyUNfK4TNtuI2Q4ytOdkUdT5acwjBjOsJuqNHHL2g==
X-Received: by 2002:a63:4d8:: with SMTP id 207mr32132pge.146.1597136388443;
 Tue, 11 Aug 2020 01:59:48 -0700 (PDT)
Received: from gamma11.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id w10sm1282499pjq.46.2020.08.11.01.59.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Aug 2020 01:59:47 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>
Subject: [PATCH 0/3] RFC: target/riscv: add half-precision floating-point
 extension
Date: Tue, 11 Aug 2020 01:59:23 -0700
Message-Id: <1597136381-17296-1-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=chihmin.chao@sifive.com; helo=mail-pg1-x52a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 Aug 2020 08:59:52 -0000

The spec is a draft but required by vector extension.  The reference is 
availabe at
   https://github.com/riscv/riscv-isa-manual/tree/zfh

The patch depends two unmerged patch set
  1. extend softfloat to support int8 and alternative NaN probagapation
  2. NaNBox fix

Based-on: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com>
Based-on: <20200724002807.441147-1-richard.henderson@linaro.org>

Chih-Min Chao (2):
  target/riscv: add NaN-Boxing helper for half-float
  target/riscv: support 'x-k' in cpu option

Kito Cheng (1):
  target/riscv: Implement zfh extension

 target/riscv/cpu.c                        |   4 +
 target/riscv/cpu.h                        |   2 +
 target/riscv/fpu_helper.c                 | 180 ++++++++++
 target/riscv/helper.h                     |  34 ++
 target/riscv/insn32-64.decode             |   6 +
 target/riscv/insn32.decode                |  32 ++
 target/riscv/insn_trans/trans_rvzfh.inc.c | 531 ++++++++++++++++++++++++++++++
 target/riscv/internals.h                  |  16 +
 target/riscv/translate.c                  |  16 +
 9 files changed, 821 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.inc.c

-- 
2.7.4


