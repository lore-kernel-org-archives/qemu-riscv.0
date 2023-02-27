Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWTuu-0003WF-69
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 22:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pWTut-0003Vx-14; Sun, 26 Feb 2023 22:11:07 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pWTur-00066u-Ik; Sun, 26 Feb 2023 22:11:06 -0500
Received: by mail-ed1-x52c.google.com with SMTP id cq23so20260457edb.1;
 Sun, 26 Feb 2023 19:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/CUFEo9DLk9IPFLYkL8BU/syEVDuSIUTZOpiYe8vhI=;
 b=QgUyPEViZvmqCbGeqKhV3idsq3nU1qlk+Xx7HYIZfGUax/MHXahmoZzi1NeydXySax
 gUNRoJf6ikgCrUd9hQm3dMCh9AtxZBrV/Jq1JvQ11d1x7yk1Y1jEyzTTBTTeUA1w130V
 4Ti+gtX1R1XDOC9vgZvbB+yLGw6w5SZTS5TgsGBkncX8MuJg1dlP5Saytoqpy003KXNV
 ZmCVvIsy1MLekRzP+RhdGBc58v/B/uUrUiXATgRvxQ01yHc/SPpaJS1E3+Fq9B4IqaTT
 LCugwqVyDUD1KtlElTuBwviZhOsAcwW69VukmgX2xBZhZeYoi6Pu6E9hQCuYYb/FagZu
 1t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/CUFEo9DLk9IPFLYkL8BU/syEVDuSIUTZOpiYe8vhI=;
 b=I5nRceAr2jOKN+WwhF7j5f6eFjRHWEbinZI2PKPFt5K9MBILhbfBc+u0h8LUI89Pjv
 RXrr4uavOOc3nDWq4NaBMqTh4+Z2BCdqMKdiuqvxaTNwrb1SpjBMGy0H6neSYTZyGR60
 28r6lfej14dXscET6Bc99Z2RECvBiKQlD4WyenyQNYlJg5XpqTmg3JU/X+y6PeC0Upb1
 JoI7LBmyiRnT4PEC+YEWRBhr8sUk8pjfG5lJOb+cIhsTvR5wKiL75klUN6b3UppA9FiU
 hhD6+v5vfzd5tLY0M3POpaof2IiIuytZnozUPjH+ybVf2D/zEAYMPN9GAPvdS6S4Ms0D
 jFWw==
X-Gm-Message-State: AO0yUKWhOaVwIWNnBotuJQJA5HgzVfyFoCAWDBs2RDlZY2E2HXBcgl+9
 qs3zlsiWnuWlPjRnx9fKUq6yTa3Ea6xWs0A1HNw=
X-Google-Smtp-Source: AK7set8zZzmUdD60tUtiNzGsJFWz4ov0YBmYXk9c6Ou6s3INuTINWK8wGH16RElBzLwUdg7TInkX2pAFgqXIsgzLH4Q=
X-Received: by 2002:a50:d51d:0:b0:4ac:b618:7fb1 with SMTP id
 u29-20020a50d51d000000b004acb6187fb1mr10876759edi.6.1677467463919; Sun, 26
 Feb 2023 19:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20230224212543.20462-1-palmer@rivosinc.com>
 <20230224212543.20462-2-palmer@rivosinc.com>
In-Reply-To: <20230224212543.20462-2-palmer@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Feb 2023 11:10:52 +0800
Message-ID: <CAEUhbmXhkCL+bZqjtZ69W_05o1sWHytCYPG5sNv7y4kAyhUgRw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gitlab/opensbi: Move to docker:stable
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: thuth@redhat.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
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
X-List-Received-Date: Mon, 27 Feb 2023 03:11:07 -0000

On Sat, Feb 25, 2023 at 5:26=E2=80=AFAM Palmer Dabbelt <palmer@rivosinc.com=
> wrote:
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
> This just moves to docker:stable, as was suggested by the template.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .gitlab-ci.d/opensbi.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Thanks Palmer for looking into this!

Reviewed-by: Bin Meng <bmeng@tinylab.org>

