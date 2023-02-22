Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUrTb-00066f-5z
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 10:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pUrTZ-000650-BL
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 10:56:13 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pUrTX-0008L5-AJ
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 10:56:13 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 na9-20020a17090b4c0900b0023058bbd7b2so8696224pjb.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 07:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=slDmqUv5p7vsOMrfeJKFL1boce1sUErNzA/SV4DGORE=;
 b=LCeLR2K6m2GkqgoJnB8jOrqhzgGu6yR4k+wOnF9StWd5ZuHl9lPuuh+3drBT18wE+L
 HKOWpmmL6hduvjBdGQ3F1WcdvXLLQwP5Ao983WIcikJCBTAlk29zFHAJy5EOKWOwiy5z
 lxFcRxJEuEZv9/dPoluPtzcrRYPX3QCUF0Nsso1MIadOd9BUltr6ORpm3eIy3KrQko3R
 31vMWSRdNkrJpjL/JOViUtgljVWtQVjt1zBbuSjXzJMEG0isdm6h/vEu2qHQRnBlRnBU
 HymKKGrysp+Bl1misyG6ugHHWN92IyV87Vv6O60vL1XjoycT7bysyfc0I4wyl61e9Mdk
 hCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=slDmqUv5p7vsOMrfeJKFL1boce1sUErNzA/SV4DGORE=;
 b=hl1vG8fgXNag6wv3hTV1iomcNFaWVer6nY4iLh5OUDNGRISYUn1hNjTBVOy51VURUn
 uzBJSLXd3uCGNqCwp8qY5o+faO6VELm7bZ1V9IAvn0zUOQ73WlFAu4PF2Bqq5iAmXAsj
 YuJE5kdCx2WR9cKYdCUMWCKHXJsqIOPaKVG1jdiTkVHcL2VietcBwznpwSbgu3dPdCiy
 HbkYai+SuM58sBKKy7JEQtcwWtHnBmnu0jNbhQ6JXCYEvQ1tIMSczA0LkHs8/HM/ThzL
 u7w+WoHF5cBdNQQMWNp3PrVMhOHKCQxDG4nDJyjdqMI0q+RAbs4k4+ZfKokpbAenUUiz
 NlYg==
X-Gm-Message-State: AO0yUKWOPSc+ycAreX5IwvCrhdClmNJJcqhfHA9WiZKsOHl/z2rlMyle
 ZNCAC6EZlt1CcvHtFvwQeydBsgMi7mm+5V4q
X-Google-Smtp-Source: AK7set9Gx7NYA5axy6cC3rLkbDeh4X56vVAMkXy+TVH61QCCB9s8dWcunwOkbV/dPzRxRMBfZBMy6w==
X-Received: by 2002:a17:90b:17d0:b0:233:b849:7e8f with SMTP id
 me16-20020a17090b17d000b00233b8497e8fmr8242308pjb.47.1677081369048; 
 Wed, 22 Feb 2023 07:56:09 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 o14-20020a17090ad24e00b0023087e8adf8sm5054258pjw.21.2023.02.22.07.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:56:08 -0800 (PST)
Subject: [PATCH] gitlab-ci.yml: opensbi: Move to Ubuntu 22.04
Date: Wed, 22 Feb 2023 07:49:38 -0800
Message-Id: <20230222154938.9201-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 alex.bennee@linaro.org
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Wed, 22 Feb 2023 15:56:14 -0000

It looks like the Ubuntu 18.04 Docker images are tripping up our CI with

    $ docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA --tag $IMAGE_TAG .gitlab-ci.d/opensbi
    Step 1/7 : FROM ubuntu:18.04
    18.04: Pulling from library/ubuntu
    mediaType in manifest should be 'application/vnd.docker.distribution.manifest.v2+json' not 'application/vnd.oci.image.manifest.v1+json'

Since 18.04 hits EOL at the end of April (a few months), let's just move
to 22.04 now.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I don't even know how to test this, as I've not touched the CI yet.  The
hope is that it fixes the failures in
<https://gitlab.com/qemu-project/qemu/-/jobs/3808319659>.
---
 .gitlab-ci.d/opensbi/Dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/opensbi/Dockerfile b/.gitlab-ci.d/opensbi/Dockerfile
index 4ba8a4de86..2fbc9a9ee7 100644
--- a/.gitlab-ci.d/opensbi/Dockerfile
+++ b/.gitlab-ci.d/opensbi/Dockerfile
@@ -1,7 +1,7 @@
 #
 # Docker image to cross-compile OpenSBI firmware binaries
 #
-FROM ubuntu:18.04
+FROM ubuntu:22.04
 
 MAINTAINER Bin Meng <bmeng.cn@gmail.com>
 
-- 
2.39.1


