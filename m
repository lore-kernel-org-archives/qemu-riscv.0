Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81DDCDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 11:31:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtniY-0007z0-IX; Fri, 20 Oct 2023 07:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtniW-0007vJ-2O
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 07:31:00 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtniT-0000PA-Hv
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 07:30:59 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40675f06f1fso10755765e9.1
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 04:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697801456; x=1698406256; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x9PiLiKWZP0A15mhDUrEz3k+BPD7Zn+8gTlk+P9gEtg=;
 b=A0Mm2MeE05OnxgW26pmiA8460GVfDK4ieEojg46x8XIyV7txPAh4t5QUNTfhurgdbr
 0f6b045MwYyh+JpOoOcCId2Cs2UBa2zV5HPo8TeXFUekT0tMc2/9TDsgVNginH4/vWMT
 TeP1geisyNy+t7bn8p5WrlIKabnMcbhA6D9vTrOyYnKyh63h8zP5WxNG9KoFD4ThAGAS
 B2sEDDFvULiT9I37E71S5CXrSABpng/DZhEkXR0kQd2a2eKGuU1mBG3OXP2f8/vCnzJ0
 F8dBsqCr7VGn0vYxDtLd3sga+pEci6yJ2XeiXR/Mva1ihQc+kUNYAQRLJyR+TdqQdR9D
 qs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697801456; x=1698406256;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x9PiLiKWZP0A15mhDUrEz3k+BPD7Zn+8gTlk+P9gEtg=;
 b=Hf3HdpMEnx36LSl7V8PnL/HZoG2oROtfQieGo2pPIum/M9jYv15nUJpYJK6dIwDlr4
 +K10PARvjTYjy0V+Q07Pu0cc5q8VDK/j3loH7uMmaG7f7uUpa4iOrE8JwzNURJM/owp2
 bH//Lrk68eNM6UrNNGtiFiqSpZuRJu+bAxpM48b7FmjH508HjUopjzd1YgKW2nel5yhN
 7hQALHdYwc5x3AhUk9UPVK5ApAAqd0/bXVf6ZaZloLl8AIDY/5LQ9LtD9KtS3abz1iHU
 4W10cTUNjswM+B7iF4igl4ePKr1uP+Td9jtvFWwmWB92t0bmfqDwbG5AXa3sAZe7BeaV
 hafw==
X-Gm-Message-State: AOJu0Yxmj1PPRdL1eD1313wtxtmjcBwKMGF5FnIan0lsINKNRjaHhQ1X
 4ceHhYmP32fT02u59fm79P2/3g==
X-Google-Smtp-Source: AGHT+IHzpkd4LbkyL6AprA4tyg8azhrSc/APnL1zyw9IkUuiK2LsQJk9E6SHYIFVIhyxDXQ0Fthbtg==
X-Received: by 2002:adf:eb87:0:b0:32d:dd68:e83 with SMTP id
 t7-20020adfeb87000000b0032ddd680e83mr3922573wrn.21.1697801455790; 
 Fri, 20 Oct 2023 04:30:55 -0700 (PDT)
Received: from [192.168.69.115] (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 ay10-20020a05600c1e0a00b00405442edc69sm4133104wmb.14.2023.10.20.04.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 04:30:55 -0700 (PDT)
Message-ID: <94280b39-a331-003d-f227-38c3e1b94434@linaro.org>
Date: Fri, 20 Oct 2023 13:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 00/16] target: Make 'cpu-qom.h' really target agnostic
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
References: <20231013140116.255-1-philmd@linaro.org>
 <ZTIVQfTmkK05fln9@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZTIVQfTmkK05fln9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Hi Zhao,

On 20/10/23 07:50, Zhao Liu wrote:
> Hi Philippe,
> 
> On Fri, Oct 13, 2023 at 04:00:59PM +0200, Philippe Mathieu-Daudé wrote:
>> Date: Fri, 13 Oct 2023 16:00:59 +0200
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: [PATCH v2 00/16] target: Make 'cpu-qom.h' really target agnostic
>> X-Mailer: git-send-email 2.41.0
>>
>> Since v1:
>> - Added R-b tags
>> - Addressed Richard comments
>> - Postponed OBJECT_DECLARE_CPU_TYPE() changes
>>
>> A heterogeneous machine must be able to instantiate CPUs
>> from different architectures.
> 
> Does this mean the different ISA cores in heterogeneous machine?

Yes. Currently the ARM target already allows you to do that
(multiple ISA cores within the same architecture), see the
xlnx-zcu102 and fby35 machines.

> And is this case for TCG?

This is *only* for TCG. I expect hardware accel + TCG to be
theoretically possible, but no interest has been shown for
it. Anyhow this requires heterogeneous TCG as a first step.

>> In order to do that, the
>> common hw/ code has to access to the QOM CPU definitions
>> from various architecture.
> 
> About this kind of heterogeneous machine with multiple CPUs, is there
> any initial configuration command line example?

I'm prototyping in plain C but our plan is to start with a
QMP prototype. Command line configuration is not an option,
we decided to ignore it. I'll describe that better in a RFC
document I should post soon.

Regards,

Phil.

> I'm not sure how to configure this case...The main unsure thing is
> whether the configuration is based on the granularity of the CPU
> (by "-cpu") or the granularity of the core device (by "-device
> xxx-core").
> 
> -Zhao



