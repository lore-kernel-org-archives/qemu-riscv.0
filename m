Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA7CCD98E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:00:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNaK-0000u0-Li; Tue, 10 Oct 2023 21:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNaJ-0000tc-Vh; Tue, 10 Oct 2023 21:00:24 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNaI-0005oT-9j; Tue, 10 Oct 2023 21:00:23 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-49d6bd3610cso2074721e0c.1; 
 Tue, 10 Oct 2023 18:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696986019; x=1697590819; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=++o7UftkOXHi8q803uDAaQvUzbJ0NQP3tioGwwFGfjU=;
 b=eM2HGa5Owl3OUq66klilXQOR0mC+dtctutjW1lzsSF8ofUStEzdnaAiJxyyRMZtJKv
 O5sQsTMWx5Oa6MtQBu2AKfpnDPqQwJpZ+C34BlavJPnXHqYPaB16Wdy8Rx4Eys/H3nJ6
 XkJzc7xEQH313GCyNqAEVbaBXjNAe7OiuUYDn4UxqJarekSljPuMIqp+fPbcwPT4QzlT
 lUhEpOgDkifDk3xF40Kj0PSfJCh1SRPC2vxwW4HneZcvD5OAe2a9A+Yy64uox+VGQulb
 QaOPXyxjcL3+ZurwK5B/ScIl453Se4t0PyqOpDAAcS0WHwThHi4rg7EbEqrmxYicgJsV
 qRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696986019; x=1697590819;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++o7UftkOXHi8q803uDAaQvUzbJ0NQP3tioGwwFGfjU=;
 b=gEiCxjs4WWKLytoM3PX+6Vx+W8bsbTsmYu+OI6/jwlRBcNy5b3wvPJvQiFqgHdxuXU
 cw56wKYvncBYV3Fg8xtzLWgHqgNHA8Wc0TvEV6amKrvNAbDKFWq4zuNOGw8owvIXfh35
 DFiISU/uLEZVD5PkQ4gsVj5wLxp5KrDB+On6HT5GWEREJvgwDMU1LiQqqCQedzN1sqaO
 zaAoIEqs2cAji/UhSlKk1cfSK9v2yh6FrbO2zjgZoOI10DjrpB1jyeSwteaZ/ypxQ6SU
 gzGMfIBZP7e0iI5lc4V86MuLpGfKI7XQHY8PITWt/ZM3ZpfEvZvMb6ToPtwTt6AlR/u9
 oSmQ==
X-Gm-Message-State: AOJu0Yz48CzaJ4yqKY+noQKdt15I5DuMr53trnWbeqBUhehATv4KesOv
 v73FTneTzx1oYI2gfy9qIWyQjEx4kzzh0I95qsE=
X-Google-Smtp-Source: AGHT+IGOTekLtXsKXqcaZWKvLoEU95j0yEnCWAbkefEpVHJTMrfRmKg+4u5NpSxd4S2qicxHJJhgrlzrmwmIaho5mrI=
X-Received: by 2002:a1f:da84:0:b0:49a:bff1:23 with SMTP id
 r126-20020a1fda84000000b0049abff10023mr16645118vkg.5.1696986018847; 
 Tue, 10 Oct 2023 18:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-7-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-7-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 10:59:52 +1000
Message-ID: <CAKmqyKM-93jCM5-Q4+wJJ7Yv1Z2OX6jr8nC3qzSQLFBi5y1gLg@mail.gmail.com>
Subject: Re: [PATCH 06/25] configure: allow user to override docker engine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, David Hildenbrand <david@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, 
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Oct 10, 2023 at 3:52=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> If you have both engines installed but one is broken you are stuck
> with the automagic. Allow the user to override the engine for this
> case.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  configure | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 707132a3ae..ebad155d9e 100755
> --- a/configure
> +++ b/configure
> @@ -180,6 +180,7 @@ fi
>  # some defaults, based on the host environment
>
>  # default parameters
> +container_engine=3D"auto"
>  cpu=3D""
>  cross_compile=3D"no"
>  cross_prefix=3D""
> @@ -787,6 +788,8 @@ for opt do
>    ;;
>    --disable-containers) use_containers=3D"no"
>    ;;
> +  --container-engine=3D*) container_engine=3D"$optarg"
> +  ;;
>    --gdb=3D*) gdb_bin=3D"$optarg"
>    ;;
>    # everything else has the same name in configure and meson
> @@ -921,6 +924,7 @@ Advanced options (experts only):
>    --enable-plugins
>                             enable plugins via shared library loading
>    --disable-containers     don't use containers for cross-building
> +  --container-engine=3DTYPE  which container engine to use [$container_e=
ngine]
>    --gdb=3DGDB-path           gdb to use for gdbstub tests [$gdb_bin]
>  EOF
>    meson_options_help
> @@ -1195,14 +1199,14 @@ fi
>  container=3D"no"
>  runc=3D""
>  if test $use_containers =3D "yes" && (has "docker" || has "podman"); the=
n
> -    case $($python "$source_path"/tests/docker/docker.py probe) in
> +    case $($python "$source_path"/tests/docker/docker.py --engine "$cont=
ainer_engine" probe) in
>          *docker) container=3Ddocker ;;
>          podman) container=3Dpodman ;;
>          no) container=3Dno ;;
>      esac
>      if test "$container" !=3D "no"; then
>          docker_py=3D"$python $source_path/tests/docker/docker.py --engin=
e $container"
> -        runc=3D$($python "$source_path"/tests/docker/docker.py probe)
> +        runc=3D$container
>      fi
>  fi
>
> --
> 2.39.2
>
>

