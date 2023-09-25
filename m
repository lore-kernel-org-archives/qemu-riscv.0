Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CD4CE7A9B
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 16:09:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qko92-0000kQ-64; Mon, 25 Sep 2023 12:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qko8y-0000jU-5B
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 12:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qko8v-0007nO-Ln
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 12:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695658145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3o09FgjP2mri3S7JGXJqW1njdmzYkmcoW/evXL5zVCg=;
 b=Rb7XmU4/DKwNaKZJ6agEdiAqfZJvHTWDsms7cp8osN++7UvNrIWOZHMCesLmgPwmzmPqKs
 HxhW/2Kun57qWagasoZJpg0ARVP/S0mthcu7vaRILJ4Q7lRV9idM9bZO4vtZCQ21pg8k9c
 cI0UH86yrijEQzCYgmnVwtbHnt0IHFg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-i0pbIeOQPVKtw-8bsl24aw-1; Mon, 25 Sep 2023 12:09:03 -0400
X-MC-Unique: i0pbIeOQPVKtw-8bsl24aw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-317d5b38194so2968336f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 09:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695658142; x=1696262942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3o09FgjP2mri3S7JGXJqW1njdmzYkmcoW/evXL5zVCg=;
 b=Q4wMk4hm2qRx2PX2iXkAc0Nvm3ZZGAFm85eraW2xAxIoY4o8S/BfxGWCVff0Eglf5R
 IKeSzV/F8TRD8nW3oGHpqh6HST+rYnT2fd1dRnIWmRWM8amZGXiVaFjD5oZQIWDJvbrF
 okFVscUpotgA2knakP4+mVu2urXgCs1aIMxF4d/PsbiKBDmRAhcdvTKou7ejb5O0BjyZ
 CLbq7gBNPMxx9qvLSN3dhHEkRrvoRmkDObbvHWakeVjlzvdwcWH4L8x0L4x7q11kc2aC
 iYV+NiYgz8jqSVmy9NIWzwrnIoodQNJTpbo3xi60zaZtFtedsXOY46lBBX2IwhWcUqWX
 spmA==
X-Gm-Message-State: AOJu0YxnSJ/+N0t2SylgT5HS5rOOCq7TJ+IO7K9r38AgvF8DyUYaRc1H
 LcI842U+JlHvd+ewVIm6c1FR7fupaTzkcdTlXZbW+bx8xtCxFoUUury5J4/f/Mi8X76liX9e6bl
 SqgCEpziKCiOvA54=
X-Received: by 2002:adf:f583:0:b0:317:6734:c2ae with SMTP id
 f3-20020adff583000000b003176734c2aemr67805wro.11.1695658142079; 
 Mon, 25 Sep 2023 09:09:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUpWxAiwheBf6zPNa+xiHCBgnt/6MLcrkQ/lGgH52gcNq1HepKsz8F773I/BgWVVKNVPZj8Q==
X-Received: by 2002:adf:f583:0:b0:317:6734:c2ae with SMTP id
 f3-20020adff583000000b003176734c2aemr67780wro.11.1695658141713; 
 Mon, 25 Sep 2023 09:09:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 19-20020a05600c229300b00405953973c3sm1928585wmf.6.2023.09.25.09.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 09:09:00 -0700 (PDT)
Message-ID: <a801cde2-e75e-4e4c-243f-887296f0322d@redhat.com>
Date: Mon, 25 Sep 2023 18:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/31] tests/docker: make docker engine choice entirely
 configure driven
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-6-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230925144854.1872513-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/25/23 16:48, Alex Bennée wrote:
> Since 0b1a649047 (tests/docker: use direct RUNC call to build
> containers) we ended up with the potential for the remaining docker.py
> script calls to deviate from the direct RUNC calls. Fix this by
> dropping the use of ENGINE in the makefile and rely entirely on what
> we detect at configure time.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure                     | 1 -
>   tests/docker/Makefile.include | 7 ++-----
>   2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/configure b/configure
> index e08127045d..707132a3ae 100755
> --- a/configure
> +++ b/configure
> @@ -1694,7 +1694,6 @@ if test -n "$gdb_bin"; then
>   fi
>   
>   if test "$container" != no; then
> -    echo "ENGINE=$container" >> $config_host_mak
>       echo "RUNC=$runc" >> $config_host_mak
>   fi
>   echo "SUBDIRS=$subdirs" >> $config_host_mak
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index dfabafab92..035d272be9 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -17,8 +17,7 @@ endif
>   DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
>   
>   RUNC ?= docker
> -ENGINE ?= auto

This was used when using docker-* from the source directory.  What about 
changing it to:

RUNC ?= $(if $(shell command -v docker), docker, podman)

No complaint on removing ENGINE= though.

Paolo

> -DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
> +DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(RUNC)
>   
>   CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
>   DOCKER_SRC_COPY := $(BUILD_DIR)/docker-src.$(CUR_TIME)
> @@ -158,7 +157,7 @@ $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
>   )
>   
>   docker:
> -	@echo 'Build QEMU and run tests inside Docker or Podman containers'
> +	@echo 'Build QEMU and run tests inside $(RUNC) containers'
>   	@echo
>   	@echo 'Available targets:'
>   	@echo
> @@ -198,8 +197,6 @@ docker:
>   	@echo '    EXECUTABLE=<path>    Include executable in image.'
>   	@echo '    EXTRA_FILES="<path> [... <path>]"'
>   	@echo '                         Include extra files in image.'
> -	@echo '    ENGINE=auto/docker/podman'
> -	@echo '                         Specify which container engine to run.'
>   	@echo '    REGISTRY=url         Cache builds from registry (default:$(DOCKER_REGISTRY))'
>   
>   docker-help: docker


