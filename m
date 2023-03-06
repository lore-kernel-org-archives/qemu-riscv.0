Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIwf-0006aT-PC
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwd-0006VW-NT
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:35 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwc-0006qY-3N
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:35 -0500
Received: by mail-pj1-x1034.google.com with SMTP id x34so11342288pjj.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140272;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLk5MjQxWqWUwFhPTSIibV1K6q+m6IrRjjb/wMuUX4M=;
 b=0zYWOIYH+DBo3z57wwOjjOsX7dM9dQqjq9xwbyVv3OXzLeYstqUeR38IjTGld0+ZyX
 ntkd7Ly8huf+UanzVlHJjY2etHBEq4QfCdYymX5x+bOcnALEuFkHPm+X2Z+ve2/Cfuv5
 w6PWEiST5k7t/P85O7MiXLgbSAVjlWoxAtrf0M4jVKcncaid1+iRT1FgvVKgPc0P7g0n
 5vTsSXWuE6+0ojCe7cfPpNhH34ZK3cnRsVpS6WJ5A7rC/mdxhZqKJGvxZKhiTacoiDu+
 VmJTrX0nuOejEcaDglhJRLBJ8FyLI8ZFQqHeKtCHR407ejAnLud3GXmY78UOI+bjz1f8
 VedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140272;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LLk5MjQxWqWUwFhPTSIibV1K6q+m6IrRjjb/wMuUX4M=;
 b=vH/DxfoQ3j3+p7GsIA/7pywUdFZLd2kXGKCZH3julOPFZxKbOaufRk+4d+U8fQwTmp
 05HPYDjYtr/vfLyjOZVUKG9IQ8GPRusayk+77Vusss/apL0s6mxX/8NSSNuLRimA/hTS
 9TQCCY/yIJu7vOIVW+7Qy/e8/tK9nwcTxWdMtFKDcij14nZ9NpuCo9M6MjnYooUly6fD
 4OEImqfanYpMr3gcZ98IcNRuQQkMmmzV6Bnm2qqGFD96wdHaWphwMcX+r4eBhgAt1Xq9
 BR3xmI5IMZqfbZXaHmvDIH7SXOV06TfBkR+/KRsGly3sQwvz69i5x1XL3dBDFnUOlmEb
 4vNw==
X-Gm-Message-State: AO0yUKXQlV7ZMpShnQcvkXxpuaa6f0wtHe1eg1VwoZQlDYdfQxE79sib
 NHq+DxxLrWN/VMgu9qXxZ7Isi0zEflb/OKdqbSg=
X-Google-Smtp-Source: AK7set/b7KPpusAKYfkDCI8sIuqXhGoybWlj79GVCaRJnP+0Bxw+0en4d25KkPYVx/rUKCdWr1DnjQ==
X-Received: by 2002:a17:903:283:b0:19e:b9f8:1fca with SMTP id
 j3-20020a170903028300b0019eb9f81fcamr6704665plr.10.1678140272623; 
 Mon, 06 Mar 2023 14:04:32 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 lc5-20020a170902fa8500b0019a7bb18f98sm7235846plb.48.2023.03.06.14.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:32 -0800 (PST)
Subject: [PULL 08/22] gitlab/opensbi: Move to docker:stable
Date: Mon,  6 Mar 2023 14:02:45 -0800
Message-Id: <20230306220259.7748-9-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@rivosinc.com>, Bin Meng <bmeng@tinylab.org>
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
X-List-Received-Date: Mon, 06 Mar 2023 22:04:35 -0000

The OpenSBI build has been using docker:19.03.1, which appears to be old
enough that v2 of the manifest is no longer supported.  Something has
started serving us those manifests, resulting in errors along the lines
of

    $ docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA --tag $IMAGE_TAG .gitlab-ci.d/opensbi
    Step 1/7 : FROM ubuntu:18.04
    18.04: Pulling from library/ubuntu
    mediaType in manifest should be 'application/vnd.docker.distribution.manifest.v2+json' not 'application/vnd.oci.image.manifest.v1+json'

This moves to docker:stable, as was suggested by the template.  It also
adds the python3 package via apt, as OpenSBI requires that to build.

Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-ID: <20230303202448.11911-2-palmer@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .gitlab-ci.d/opensbi.yml        | 4 ++--
 .gitlab-ci.d/opensbi/Dockerfile | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 04ed5a3ea1..9a651465d8 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -42,9 +42,9 @@
 docker-opensbi:
   extends: .opensbi_job_rules
   stage: containers
-  image: docker:19.03.1
+  image: docker:stable
   services:
-    - docker:19.03.1-dind
+    - docker:stable-dind
   variables:
     GIT_DEPTH: 3
     IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
diff --git a/.gitlab-ci.d/opensbi/Dockerfile b/.gitlab-ci.d/opensbi/Dockerfile
index 4ba8a4de86..5ccf4151f4 100644
--- a/.gitlab-ci.d/opensbi/Dockerfile
+++ b/.gitlab-ci.d/opensbi/Dockerfile
@@ -15,6 +15,7 @@ RUN apt update \
         ca-certificates \
         git \
         make \
+	python3 \
         wget \
     && \
     \
-- 
2.39.2


