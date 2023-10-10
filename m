Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9A5CD80B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 11:57:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqBMM-0006in-HA; Tue, 10 Oct 2023 07:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqBML-0006hb-5m
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 07:57:09 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqBMJ-0000ET-Gi
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 07:57:08 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53636f98538so9605563a12.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696939026; x=1697543826; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eWF+m4pmlfZLAIpIOX8F8HUE5rhtBj2ixSHT38voTQM=;
 b=IJpj6IFhbiGFgFYVguosIuf52F/3a6EKI0OZfNCDYsH8PtwW5cyuuWMoFGbeRDnFzj
 eTnKSwXGESKe/FH9h5K1negUR7z0FBhoRzqg8CkDNrpDJXq8qoxlAAqbFrgfbHIWo+p0
 PkMBRlqVfHCnyE+2+OTcNEUxA3mc5tXGzdIbexMMOO5qK0lAM5ksADrKz5Na1u2A+p0x
 MkIGVyEuXK/DiBGT1SQHIMOwxVUhuyHewacG4F02am+db4caRCnDlqse426wPBpM4eyc
 c99cW114OcUVfWez0TVpjIbH627A2b3gDE/7/OmQ/Eml7Z2zBH0r25BXnqCe+EYiI3sF
 vOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696939026; x=1697543826;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eWF+m4pmlfZLAIpIOX8F8HUE5rhtBj2ixSHT38voTQM=;
 b=eeEYI3UvwGzYK/SWUXeym2dNOph7mIYcsAZdazUaA+cU5l5q/a08JDEhb7rcNlG/tg
 36R4A3M9o/K7RmOooPDHf9jRbgITvZeqqhZYz0pVP+hYi+MsJhU6iuSc1rMEQM/FC7U2
 5+S8M5iEERV8Aj8RR2skhk6sWXH8WFMFmdHb9/yUwJ8mb/f5cNrdV/a/L5Rvkdlo6MN1
 GqFCgr4SD/4jApU39qqK3FAZ4bbYWpr6Th7tovjvbWhMyLLUqMPWKpHGBkr6kX8fkJEf
 Eurw9bY7M9BZJE7xugqsKcYYiarTEqv7vc0M1tm7ERPW1K9nlutiO0xGNeJ3Ucs3Bl9g
 whUQ==
X-Gm-Message-State: AOJu0Yw8CbKrXvRaLIAS8JslVPzkc0c2Y1igllvH2nwyZKOeReoV6HH/
 NuRXv3yXRNB4GvW4rtpJ9VifqA==
X-Google-Smtp-Source: AGHT+IHfB145nG+TeoZSEt8bxGhD8xr+jSnAGmMzYeB8hHxke6AQOQFtI21tddfQo93Ic2/LaESFjQ==
X-Received: by 2002:a05:6402:4308:b0:53d:983c:2672 with SMTP id
 m8-20020a056402430800b0053d983c2672mr1269807edc.38.1696939026191; 
 Tue, 10 Oct 2023 04:57:06 -0700 (PDT)
Received: from [192.168.69.115]
 (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
 by smtp.gmail.com with ESMTPSA id
 c25-20020aa7d619000000b0053622a35665sm7438272edr.66.2023.10.10.04.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 04:57:05 -0700 (PDT)
Message-ID: <68a6e682-3cfd-9ea9-a81e-3f244b7893da@linaro.org>
Date: Tue, 10 Oct 2023 13:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 03/25] tests/lcitool: add swtpm to the package list
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231009164104.369749-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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

On 9/10/23 18:40, Alex Bennée wrote:
> We need this to test some TPM stuff.
> 
> Message-Id: <20230925144854.1872513-3-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus/macos-12.vars                    | 2 +-
>   tests/docker/dockerfiles/alpine.docker               | 1 +
>   tests/docker/dockerfiles/centos8.docker              | 1 +
>   tests/docker/dockerfiles/debian-amd64-cross.docker   | 1 +
>   tests/docker/dockerfiles/debian-amd64.docker         | 1 +
>   tests/docker/dockerfiles/debian-arm64-cross.docker   | 1 +
>   tests/docker/dockerfiles/debian-armhf-cross.docker   | 1 +
>   tests/docker/dockerfiles/debian-ppc64el-cross.docker | 1 +
>   tests/docker/dockerfiles/debian-s390x-cross.docker   | 1 +
>   tests/docker/dockerfiles/fedora-win32-cross.docker   | 1 +
>   tests/docker/dockerfiles/fedora-win64-cross.docker   | 1 +
>   tests/docker/dockerfiles/fedora.docker               | 1 +
>   tests/docker/dockerfiles/opensuse-leap.docker        | 1 +
>   tests/docker/dockerfiles/ubuntu2204.docker           | 1 +
>   tests/lcitool/libvirt-ci                             | 2 +-
>   tests/lcitool/projects/qemu.yml                      | 1 +
>   16 files changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


