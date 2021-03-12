Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKeuZ-0000Le-Me
	for mharc-qemu-riscv@gnu.org; Fri, 12 Mar 2021 05:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuU-00007R-0Y
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:20:46 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuJ-0005EE-5i
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:20:45 -0500
Received: by mail-ej1-x629.google.com with SMTP id lr13so52369701ejb.8
 for <qemu-riscv@nongnu.org>; Fri, 12 Mar 2021 02:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7m175x/89IYovvE0alvawrCLn8AfRPZq9j4HkwrcQjw=;
 b=xsvsydy9RgYTkTqEOR95wHyEbC/b+PyZWO8z8wMObfnQTZnUiTaaS8JPlMS2bNm/4e
 HNrUkGGdNNjkEa3DV/cu+C84A6yRWTUC3f/XHcHMk12wyp44r3YDn4GDQNLYqdR9GkmU
 1EDOVpfN0Wk6eJKFeccq0bSsmm+roSIN7Sa1NEzqz8DP7A/oGriwqAcFAbwRQXLM2KwK
 bw9x8I3Aa9oAudDJlo8jdgKQOQhl8Qk9Jx3mmKOcgrybjU8h6kRF3t8Pe0lOslQS49mC
 9Lvr8tch2MnvtuKQnH/HfuyxROCu9drSxIOoEd0DLka3LIntmAh1YVYyXjcM6+IyArYo
 HKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7m175x/89IYovvE0alvawrCLn8AfRPZq9j4HkwrcQjw=;
 b=S+WY/Ai5JC6chKnjQ3ZiDzw8s0/wtD9IZoWIRiYrFyld2/nWHRO+3ALbz8oczglndS
 z7ESRIdAPyXJ+0XBPoIMmcJ+DrJ+9FiVj6yuas0eGEuI4UrPpdllMpNDbcB5HmbiT4Rb
 wvRF2v8o5ZKnCaA0cGgdG9RuJyLyJ/1vAle57Tqri3kUwhK+yub8zDXAA9tmbpaUqf9P
 pXf1lcsgE6BvFA8VLBp82M/v4RJvOIKauD0zSalXoAYPyl/1LWcCfMTNDI1NB2JpMno4
 GAEElO6PmHe4OF7/FtGQQNyFWwwG+kLYmu57gszI/GyUc/Bz2uFJvVFK5J52fScCt0ww
 baEQ==
X-Gm-Message-State: AOAM532s0SC4WZX9KaXPvflloKEcnu5/QIets3Qym9Y3f5tbuwJ5JXAr
 5F4ePkUUnwlMXMPEYrSVeDwdzQ==
X-Google-Smtp-Source: ABdhPJxqqTS7Mfqn6VvqKeUPhAjLiwMdhdXjcDcUxCwZ4eufo7LJ/XnThml6O8OLffkg7hu2+wmwGA==
X-Received: by 2002:a17:906:19d9:: with SMTP id
 h25mr7994557ejd.453.1615544431614; 
 Fri, 12 Mar 2021 02:20:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id qo25sm2528274ejb.93.2021.03.12.02.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:20:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 96EFF1FF7E;
 Fri, 12 Mar 2021 10:20:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 0/5] semihosting/next (SYS_HEAPINFO)
Date: Fri, 12 Mar 2021 10:20:24 +0000
Message-Id: <20210312102029.17017-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 12 Mar 2021 10:20:47 -0000

Hi,

Change from the last version include tweaking the test to be a little
less asnprintf heavy and also don't rely on brk() to do it's job. It
also threw up a linux-user failure for RiscV which didn't have the
needed TaskState info set. The series now applies cleanly to master.

The following patches need review:

 - tests/tcg: add HeapInfo checking to semihosting test
 - linux-user/riscv: initialise the TaskState heap/stack info
 - semihosting/arm-compat-semi: don't use SET_ARG to report SYS_HEAPINFO
 - semihosting: move semihosting tests to multiarch

Alex Bennée (5):
  semihosting: move semihosting tests to multiarch
  semihosting/arm-compat-semi: unify GET/SET_ARG helpers
  semihosting/arm-compat-semi: don't use SET_ARG to report SYS_HEAPINFO
  linux-user/riscv: initialise the TaskState heap/stack info
  tests/tcg: add HeapInfo checking to semihosting test

 tests/tcg/aarch64/semicall.h                  | 18 +++++
 tests/tcg/arm/semicall.h                      | 15 +---
 tests/tcg/riscv64/semicall.h                  | 22 ++++++
 linux-user/riscv/cpu_loop.c                   |  5 ++
 semihosting/arm-compat-semi.c                 | 62 +++++++---------
 tests/tcg/arm/semihosting.c                   | 26 -------
 .../arm-compat-semi}/semiconsole.c            |  2 +
 .../multiarch/arm-compat-semi/semihosting.c   | 71 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 tests/tcg/Makefile.target                     |  3 +
 tests/tcg/aarch64/Makefile.target             | 18 -----
 tests/tcg/arm/Makefile.target                 | 16 +----
 tests/tcg/multiarch/Makefile.target           | 31 ++++++++
 13 files changed, 180 insertions(+), 110 deletions(-)
 create mode 100644 tests/tcg/aarch64/semicall.h
 create mode 100644 tests/tcg/riscv64/semicall.h
 delete mode 100644 tests/tcg/arm/semihosting.c
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semiconsole.c (93%)
 create mode 100644 tests/tcg/multiarch/arm-compat-semi/semihosting.c

-- 
2.20.1


