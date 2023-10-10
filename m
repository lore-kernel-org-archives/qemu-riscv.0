Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C963CD80B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 11:56:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqBM2-0006au-Or; Tue, 10 Oct 2023 07:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqBM0-0006ZH-FM
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 07:56:49 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqBLv-00005A-3n
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 07:56:48 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso952805166b.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696939001; x=1697543801; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qlfm40CNX39U3MfQmCxVxB/8tsjjTRpwPggE6Oi56Es=;
 b=hSr/zcm8wGX2U8Id3aZHuC8Thg4hfmXdwMKt6+xbSY4K2S6LiQy1RMIRTHhJCekl3p
 bTv+HTOv8/1G3j7DIUVAUXpRX/bKaCn7ssStwJdJFvtskA0y2PZmIYesxnNDdwVwVRPQ
 3KFVsCv0St6sb23c7qXfXrxlxQ0ZMGsZW1ZyrNMo1T3M5ddT4LmOdmv5Hi7sPiWpMIqI
 P8am9Ox+YP3esEju62n3XXw6Q9xhJGaV0PtiBqs0S2zMNKip35RhBYRmblPLn9qW9qI/
 eEf+nsEWcyHXTCkv8/lllnkdY2Ms9WtB/f3Y+H9cG2sP5X4hr72KC7R7g+DM4Wz21oRa
 YlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696939001; x=1697543801;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qlfm40CNX39U3MfQmCxVxB/8tsjjTRpwPggE6Oi56Es=;
 b=NS8FzjEMU0nbNZPqw9o1ppcn+gHuX/52T8ml2/v53IvqJn06KSIyQj9PpZGWo4R3UB
 rJII/7VlryAMp54h420KDzz60alrtwK6l/W2AEFMu2mMWHxdksy229U8dum2c0YosMs3
 Di6qGHQ2usy+G2uW82sxVTjd9J9IXj5XNKQW8N2GDRxBk6s3Ngmy5ZI26ZeXqEmHDbdK
 IachycdfB8TQV7zLWKX7oWh9Um0mDVqVUNTIdAtGeJzDnYR4201r/SuurHznQCO5WnHT
 CTFNK+aBjYvgkfEcfaPH1T6UdfAOtXAlAh1X/S+LcFUlFEGpLySb/jdMTsv30/cptZZ0
 87Kw==
X-Gm-Message-State: AOJu0Yw5V7o5ESkxzChPhutPYuJA1hhxAamEdcC0XrD8r8coys1fCKoH
 Pk0e0pD7g5q4ZsF+d82QBKo/1g==
X-Google-Smtp-Source: AGHT+IF4BFuHaE3LqrKLl7o1W+AUINASUjohGYH7UDTjoiIC+sZBStWET44grVxDUUzv3JS6z77EIA==
X-Received: by 2002:a17:907:b11:b0:9ae:699d:8a29 with SMTP id
 h17-20020a1709070b1100b009ae699d8a29mr15104733ejl.6.1696939001009; 
 Tue, 10 Oct 2023 04:56:41 -0700 (PDT)
Received: from [192.168.69.115]
 (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
 by smtp.gmail.com with ESMTPSA id
 kb4-20020a1709070f8400b009adc81bb544sm8337672ejc.106.2023.10.10.04.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 04:56:40 -0700 (PDT)
Message-ID: <bbd46ddb-a848-4e6f-ac5e-dcd2cf99b5c7@linaro.org>
Date: Tue, 10 Oct 2023 13:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 02/25] tests/avocado: remove flaky test marking for
 test_sbsaref_edk2_firmware
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
 <20231009164104.369749-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231009164104.369749-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
> After testing locally I decided to revert a5754847e0 (tests/avocado: Disable the
> test_sbsaref_edk2_firmware by default) as the test seems pretty
> stable:
> 
>     env QEMU_TEST_FLAKY_TESTS=1 retry.py -n 50 -c -- \
>       ./tests/venv/bin/avocado run \
>       ./tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_edk2_firmware
> 
> yields:
> 
>    Results summary:
>    0: 50 times (100.00%), avg time 2.064 (0.04 varience/0.19 deviation)
>    Ran command 50 times, 50 passes
> 
> Maybe f0ec14c78c (tests/avocado: Fix console data loss) has made it
> more reliable?
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


