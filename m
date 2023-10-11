Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD97CD98E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:03:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNcg-0002lU-08; Tue, 10 Oct 2023 21:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNcc-0002k0-Iq; Tue, 10 Oct 2023 21:02:46 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNca-0006Ma-TH; Tue, 10 Oct 2023 21:02:46 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-49ab6c1869dso279577e0c.0; 
 Tue, 10 Oct 2023 18:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696986162; x=1697590962; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=az7hRY13AXihgfwT+snngU6CrW6XXZhg5oEBwlyT9c0=;
 b=kzKyK8lvmrqAy5qvGF9AyXvK+iQjCcaPE9318g4wQPsJ95SgKjRKefkRLLwz/ve8oy
 A8hca1mqwTZ4nHhQTgXY+sf/oFw+viwZE9RyCtQg2kS0upjZvVxulLwTx7zTA83fEV3p
 gXKiHiMLmEk2aR2tiOqoPoL/6If51KLi4HJQ7wOUjbQLMjgnUndN6M7qAxm8vUYDAf2y
 JYlBD4A89W6yYx5j9u5qkOgWnSEqMZrw+PQcKRt0Xf2lIT1YnXjvCKRO1fKzBVyJ0RWe
 aqncF70AT9bZKELOlIRo9iH5RxGaArk1x7Si2TA9cemMuWzKJJrWMILaDA0pEd765hV/
 MQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696986162; x=1697590962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=az7hRY13AXihgfwT+snngU6CrW6XXZhg5oEBwlyT9c0=;
 b=annkGHFohonuqzrgN+ntAmupZ1aO9Y2q3m6FGsPlh9Yxob2HizCq6/fnKNHZcAgyUk
 u41J31bGqtVKkeUB3j1lO7RaBrf+4wBpIKSrRxXdZ+oi04Xi9xXxHup04C2BiGiTN6P3
 bcfXGgfQhGIf1fOmRcBnRJPscbtcDRoVWBgy3lrO2bI3iVWXvYS3EKPoFyU0KOns/wb6
 h8TB4gqElgi69Fs7g1UdkItdtdGaGjP9wfNe1ukUyn7NUpPWNawnEuM8kh6qLNPjOjHj
 UmcNJ2DA2eWAV3W3vfdmSScI5oyaDQxEaCYey+9EUBBpAOANwIduvt+Dm2cVg2RiNQKj
 BnxQ==
X-Gm-Message-State: AOJu0YxS1bjPhvdaTp5x3vBd50o7AASjo24dEYIDg+oW09x4Co3+0MlS
 6akM9e/rv/VSpnvlCC5RrhAjMNU40pk2qc0qSRY=
X-Google-Smtp-Source: AGHT+IEvf93Yxj4oZz0NTJ8qGczKWc2RXD6w5T6XupZRdUvKXy0nd5u+ck78IiMEVRhfzAPo/g2jvt5NP9aBq6r55FY=
X-Received: by 2002:a1f:e7c4:0:b0:49a:9f99:bb03 with SMTP id
 e187-20020a1fe7c4000000b0049a9f99bb03mr9918940vkh.1.1696986161996; Tue, 10
 Oct 2023 18:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-6-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-6-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:02:15 +1000
Message-ID: <CAKmqyKPgCd0ej7Jd8v8o-8Y=E_keMCA8v1-iLBrNKEfQn_U3ZA@mail.gmail.com>
Subject: Re: [PATCH 05/25] tests/docker: make docker engine choice entirely
 configure driven
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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

On Tue, Oct 10, 2023 at 4:05=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> Since 0b1a649047 (tests/docker: use direct RUNC call to build
> containers) we ended up with the potential for the remaining docker.py
> script calls to deviate from the direct RUNC calls. Fix this by
> dropping the use of ENGINE in the makefile and rely entirely on what
> we detect at configure time.
>
> We also tweak the RUNC detection so podman users can still run things
> from the source tree.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
> v2
>   - add RUNC stanza suggested by Paolo
> ---
>  configure                     | 1 -
>  tests/docker/Makefile.include | 9 +++------
>  2 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/configure b/configure
> index e08127045d..707132a3ae 100755
> --- a/configure
> +++ b/configure
> @@ -1694,7 +1694,6 @@ if test -n "$gdb_bin"; then
>  fi
>
>  if test "$container" !=3D no; then
> -    echo "ENGINE=3D$container" >> $config_host_mak
>      echo "RUNC=3D$runc" >> $config_host_mak
>  fi
>  echo "SUBDIRS=3D$subdirs" >> $config_host_mak
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
> index dfabafab92..ab68b2dbad 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -16,9 +16,8 @@ DOCKER_DEFAULT_REGISTRY :=3D registry.gitlab.com/qemu-p=
roject/qemu
>  endif
>  DOCKER_REGISTRY :=3D $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGIS=
TRY))
>
> -RUNC ?=3D docker
> -ENGINE ?=3D auto
> -DOCKER_SCRIPT=3D$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
> +RUNC ?=3D $(if $(shell command -v docker), docker, podman)
> +DOCKER_SCRIPT=3D$(SRC_PATH)/tests/docker/docker.py --engine $(RUNC)
>
>  CUR_TIME :=3D $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
>  DOCKER_SRC_COPY :=3D $(BUILD_DIR)/docker-src.$(CUR_TIME)
> @@ -158,7 +157,7 @@ $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(D=
OCKER_IMAGES)), \
>  )
>
>  docker:
> -       @echo 'Build QEMU and run tests inside Docker or Podman container=
s'
> +       @echo 'Build QEMU and run tests inside $(RUNC) containers'
>         @echo
>         @echo 'Available targets:'
>         @echo
> @@ -198,8 +197,6 @@ docker:
>         @echo '    EXECUTABLE=3D<path>    Include executable in image.'
>         @echo '    EXTRA_FILES=3D"<path> [... <path>]"'
>         @echo '                         Include extra files in image.'
> -       @echo '    ENGINE=3Dauto/docker/podman'
> -       @echo '                         Specify which container engine to=
 run.'
>         @echo '    REGISTRY=3Durl         Cache builds from registry (def=
ault:$(DOCKER_REGISTRY))'
>
>  docker-help: docker
> --
> 2.39.2
>
>

