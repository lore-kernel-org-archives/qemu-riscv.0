Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbfSx-000462-2T
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 04:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfSm-000424-8U
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 04:54:45 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfSe-0005Et-Vc
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 04:54:42 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m26so10459785pff.3
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYiMqfk3rKHc2z5gbK/oT2ZLGMz+FR0fiZcCBwx5Le0=;
 b=MbwqkmN4zJB2hdMv7LL8aovJH55a9xMfpr+xSfnjHru35WBf8Cp3gbPuxYqdnUbfUk
 tnBYwlMX/eOKCMFjhPZO1b984apB31Op0bjThRF5OK4txUXXr5g/FFU1tKfjCqJ8GT9t
 O8Oc+63zKi5h2A7vaJ7KQjamkEeOfn/2sT9tro3HiO7zxrsmS+9RHHCD020N/UKxwezv
 Twi19W2IFr6FinhJ35Pm0fj6buNwkJ1lbADIvmUYhXE2QcKkzqGASJwGmVTs0IZDWLYC
 FPCkyGhkNC4B1wlS8McShS59euvljezMUFI76pSucgJdTPEU1DWstKkbyiPYflhK2vzI
 G80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYiMqfk3rKHc2z5gbK/oT2ZLGMz+FR0fiZcCBwx5Le0=;
 b=dWwt4x5sMxYdM5EPw1PLR90KA2+aDRYuA29S/MA5Gu2hIxcaMEmHttItQ9TUxBA2yY
 /LbtQP4qSqW3+Nj5oFirS6+7qtulED+YnnUzlQvt7ewYyAtq6zExet1rV3N0PGdS5Q8F
 9QhRiZC1uKztFGslZzO7FR5co5jJMHlhK1VhwJd+FKiUcwj1l8IL8GM0wEzCAwH5aBnl
 wHGk9YOz4qR0D6mHgMprsZBiTeO9dZRraO4eMjyobtYY7+J242vvrN6SE9M58+NP/9kO
 okEZvpycI413Vq4y0/7OUOVd8ulnwETB3WIhvjB7S4mG2FoVggSTAwSwD8yt74sO2xur
 wYuA==
X-Gm-Message-State: AOAM533PLGB7K0azN0eiCNAHF0xMZtLuigSVzrl9d+Pqra/G4bNzJ8Uz
 F43KQh0SbYsBD/I4YXp8y+2zZA==
X-Google-Smtp-Source: ABdhPJxrZJilAyzYppeXhP3/hMJv23Tx2A+3uQvQLNL+R/Gcxx+TZMxk0reaGo3Hz5CESgzpHUuw6Q==
X-Received: by 2002:a05:6a00:992:b0:44d:8981:37f6 with SMTP id
 u18-20020a056a00099200b0044d898137f6mr12066755pfg.76.1634374473351; 
 Sat, 16 Oct 2021 01:54:33 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id p3sm7028691pfb.205.2021.10.16.01.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 01:54:33 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v4 0/2] add APIs to handle alternative sNaN propagation for
 fmax/fmin
Date: Sat, 16 Oct 2021 16:54:25 +0800
Message-Id: <20211016085428.3001501-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 16 Oct 2021 08:54:46 -0000

From: Frank Chang <frank.chang@sifive.com>

In IEEE 754-2019, minNum, maxNum, minNumMag and maxNumMag are removed
and replaced with minimum, minimumNumber, maximum and maximumNumber.

minimumNumber/maximumNumber behavior for SNaN is changed to:
  * If both operands are NaNs, a QNaN is returned.
  * If either operand is a SNaN, an invalid operation exception is signaled,
    but unless both operands are NaNs, the SNaN is otherwise ignored and
    not converted to a QNaN.

This patchset add support of the above alternative sNaN propagation for
fmax/fmin, which is required by RISC-V floating-point v2.2.

Changelog:

v2:
  * Change API names from *_noprop() to *_maximum_number()
    and *_minimum_number().
  * Pick softfloat min/max APIs based on CPU privilege spec version.

Chih-Min Chao (2):
  softfloat: add APIs to handle alternative sNaN propagation for
    fmax/fmin
  target/riscv: change the api for RVF/RVD fmin/fmax

 fpu/softfloat-parts.c.inc | 25 +++++++++++++++++++++++--
 fpu/softfloat.c           | 19 +++++++++++++------
 include/fpu/softfloat.h   | 10 ++++++++++
 target/riscv/fpu_helper.c | 16 ++++++++++++----
 4 files changed, 58 insertions(+), 12 deletions(-)

--
2.25.1


