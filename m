Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYEpE-0006I4-Mk
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 18:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pYEpC-0006HX-Jk; Fri, 03 Mar 2023 18:28:30 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pYEpA-0007BI-QW; Fri, 03 Mar 2023 18:28:30 -0500
Received: by mail-ed1-x52c.google.com with SMTP id cy23so16372826edb.12;
 Fri, 03 Mar 2023 15:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=285cnmyzebRj588xRX811oHsxiW+wew/m7qWBgyn3o0=;
 b=mKG4l/HWipqTcKb7lS9AmSUgjZ0SZdnO5YkiWZCeXYX9YIlJ/Gnzbw2zn01IGoCik5
 yT9aZNSIQir5sMkN1vjjGj6J2hECILINYxNDMkya4Y3rCfQlvuTjH/sdBP1R9NKGKqzl
 ZswAHff3vqPftjyeblmo1ZbVG0pl5w0OWb3uZbO3hrxshqR+Z4zbd/tPxKg8Fp6ZLWnt
 vLYNXouS0MGIpFJ4Prhnh1sofKlf27FCRX91P32CvzsJhTnjaWombT7teqkWgASDtcKS
 7imuy/2UmeJ24W0rpYvZn4rEYuLW7WDGogODGMdt58dguy8ETt9itqft2Xn3341EcLAz
 0U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=285cnmyzebRj588xRX811oHsxiW+wew/m7qWBgyn3o0=;
 b=kSex3NN33iGOnMRyKeB8FTLa8kr5dxNe18LCgylG/yT6WSPbC1/c6lTHiYZJ/buj7z
 xP6qYs5s5QsZOOGFbd7KOh55wAbkediktxW3r0KfawXOpBOexWHG088Oc2NwfhhQMtSU
 ptBD/JnlcbcDgdQ70FdPdxbAOrVHeLOThBWWujLTmbiPF/VsKNmlASvkEMKSr8MoDfSS
 eh3TelewFUoyLsBYR/3idxibFRrRKZwycOd7vNglIeQKKoqMfe3PfkpY5KlbsT7AzNsX
 CoV71nisjlXZrTUDbBsrvu/bi3mZjrWpZmHIC1ujEXLiy/rNH3VI49nLM8r9Kta8eXY6
 FHxA==
X-Gm-Message-State: AO0yUKXjMbg6xwV8q03ifS6OpaQHyiWM1XpDt/fL+Cl81PSkUqH4k2/N
 KF41nlVZWrGnPhS/tUDx3URtj9bfMvVdfW9eueY=
X-Google-Smtp-Source: AK7set8Ps14HXNTSwfzXSv8/7gFvEp8l5Ie4d8mmD8fTYuDWb6hzb1NS1VL81BGb8dBUz8rV83xhxd5Yl5wFQabTw4g=
X-Received: by 2002:a17:906:d51:b0:8b1:cd2e:177a with SMTP id
 r17-20020a1709060d5100b008b1cd2e177amr1710769ejh.6.1677886106082; Fri, 03 Mar
 2023 15:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20230303202448.11911-1-palmer@rivosinc.com>
 <20230303202448.11911-2-palmer@rivosinc.com>
In-Reply-To: <20230303202448.11911-2-palmer@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 4 Mar 2023 07:28:14 +0800
Message-ID: <CAEUhbmXVqJ3RnTk7OGquR-ChCSWJ8NmOGeo6kUmoFhipofm7tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gitlab/opensbi: Move to docker:stable
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 23:28:30 -0000

On Sat, Mar 4, 2023 at 4:25=E2=80=AFAM Palmer Dabbelt <palmer@rivosinc.com>=
 wrote:
>
> The OpenSBI build has been using docker:19.03.1, which appears to be old
> enough that v2 of the manifest is no longer supported.  Something has
> started serving us those manifests, resulting in errors along the lines
> of
>
>     $ docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_C=
OMMIT_SHA --tag $IMAGE_TAG .gitlab-ci.d/opensbi
>     Step 1/7 : FROM ubuntu:18.04
>     18.04: Pulling from library/ubuntu
>     mediaType in manifest should be 'application/vnd.docker.distribution.=
manifest.v2+json' not 'application/vnd.oci.image.manifest.v1+json'
>
> This moves to docker:stable, as was suggested by the template.  It also
> adds the python3 package via apt, as OpenSBI requires that to build.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .gitlab-ci.d/opensbi.yml        | 4 ++--
>  .gitlab-ci.d/opensbi/Dockerfile | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
> index 04ed5a3ea1..9a651465d8 100644
> --- a/.gitlab-ci.d/opensbi.yml
> +++ b/.gitlab-ci.d/opensbi.yml
> @@ -42,9 +42,9 @@
>  docker-opensbi:
>    extends: .opensbi_job_rules
>    stage: containers
> -  image: docker:19.03.1
> +  image: docker:stable
>    services:
> -    - docker:19.03.1-dind
> +    - docker:stable-dind
>    variables:
>      GIT_DEPTH: 3
>      IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
> diff --git a/.gitlab-ci.d/opensbi/Dockerfile b/.gitlab-ci.d/opensbi/Docke=
rfile
> index 4ba8a4de86..2d151a6bc8 100644
> --- a/.gitlab-ci.d/opensbi/Dockerfile
> +++ b/.gitlab-ci.d/opensbi/Dockerfile
> @@ -16,6 +16,7 @@ RUN apt update \
>          git \
>          make \
>          wget \
> +       python3 \

nits: this should be inserted before wget to follow the alphabetical order

>      && \
>      \
>      rm -rf /var/lib/apt/lists/*
> --

Reviewed-by: Bin Meng <bmeng@tinylab.org>

