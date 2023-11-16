Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C07C197A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 10:13:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3ZMT-0000fY-67; Thu, 16 Nov 2023 05:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3ZMR-0000f3-V7
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3ZMQ-0002iF-1R
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:12:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700129552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+u6id15jXGcOGlTGr5+ijFRSSNJOKfEYhpt2E3GbuoY=;
 b=W15FKM46oGqJemn9S6MG3XlSQAMRuBw8RCtHDvyS6FkbRYO2Igj5sqPbP8qK8TSUdniZF1
 do588lRCR8/waYT1YnDa8/cLAoqEkiiJIBMfXFFpD4AWCbkW797ZASBvwz6nqZGQiGXpa6
 giDOSR96IkyTfa2JRorTNgNul6cCgms=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-jfRewk5IOkG-Whcbrp0faQ-1; Thu, 16 Nov 2023 05:12:31 -0500
X-MC-Unique: jfRewk5IOkG-Whcbrp0faQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-6cf61d80fafso603283a34.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 02:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700129550; x=1700734350;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+u6id15jXGcOGlTGr5+ijFRSSNJOKfEYhpt2E3GbuoY=;
 b=k2bHp4yPN3tZqfTehy6KEoIvuohjqpPAHAcxJ4izk+C9T0nfEh6jJI9KAliIF3Yers
 z6CvynzaHx9M2vZoWTviJcxgdO5HO2tiQiMFBfMm8N+DjuQT8PeBpDKE/g1lw0RnWdAj
 OCuBsl+x9xHDtt69cjRaOsxvw9EUmOkvP/DbZW1LhaIYZpfznhqaBDJ2fz88L9YvUJjf
 a/zKcov28u4Kr1yYPorIRkVkcXO89mgEkuNXSCENDCnu9Su4ZmAv5DJ8dSOi/LoxfSFN
 A7VAj2gDo16cVbMLO+Ai2hD+x44n401X9rQg2W6+qaRrqCQn+vZxI/SX52yIeE9fyigR
 u9XQ==
X-Gm-Message-State: AOJu0YyC5c3Odc3S0SrxpWSC9Jozhnfp+P3yAiV03+MvHjkOzPuODuQC
 AVqZvlLHlHSMSd/F31/IPIGNwMiYe8i1BKuQXjzFkhiAJjuQ5EfVYraknmDFiXpMUS5H2g0Mxva
 +ntkahrz60/5E9AA=
X-Received: by 2002:a05:6870:7992:b0:1ef:c499:174e with SMTP id
 he18-20020a056870799200b001efc499174emr21576361oab.49.1700129550572; 
 Thu, 16 Nov 2023 02:12:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFANtGHwdbCNm6PS7GtRMj0nSbvu+I5z4rtGOaiKQ9FO3xlfbYVA2k02Ny3wIUXE1588WYqwg==
X-Received: by 2002:a05:6870:7992:b0:1ef:c499:174e with SMTP id
 he18-20020a056870799200b001efc499174emr21576349oab.49.1700129550345; 
 Thu, 16 Nov 2023 02:12:30 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 k6-20020aa790c6000000b0069344caf840sm4332076pfk.18.2023.11.16.02.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:12:29 -0800 (PST)
Message-ID: <c4607c50-420c-4ff0-bbff-8b2c2fd03f27@redhat.com>
Date: Thu, 16 Nov 2023 20:12:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <d5b43eb1-93b4-4e3e-8c37-1dabd5a4cb52@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <d5b43eb1-93b4-4e3e-8c37-1dabd5a4cb52@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Phil,

On 11/16/23 20:01, Philippe Mathieu-Daudé wrote:
> On 15/11/23 00:55, Gavin Shan wrote:
>> There are two places where the user specified CPU type is checked to see
>> if it's supported or allowed by the board: machine_run_board_init() and
>> mc->init(). We don't have to maintain two duplicate sets of logic. This
>> series intends to move the check to machine_run_board_init() so that we
>> have unified CPU type check.
>>
>> PATCH[01-04] consolidate CPUClass::class_by_name() so that the returned
>>               CPU class is checked for once in cpu_class_by_name()
>> PATCH[05]    add generic helper cpu_model_from_type() to extract the CPU
>>               model name from the CPU type name
>> PATCH[06]    add generic cpu_list(), to be reused by most of the targets
>> PATCH[07-21] switch to generic cpu_list() for most of the targets
>> PATCH[22]    use generic helper cpu_model_from_type() for several targets
>> PATCH[23-31] validate the CPU type in machine_run_board_init() for the
>>               individual board
>>
>> v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00302.html
>> v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00528.html
>> v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-09/msg00157.html
>> v4: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00005.html
> 
> Maybe I missed the comment in earlier series, but what is the plan for
> the following targets?
> 
> $ git grep 'define cpu_list'
> target/i386/cpu.h:2289:#define cpu_list x86_cpu_list
> target/ppc/cpu.h:1623:#define cpu_list ppc_cpu_list
> target/s390x/cpu.h:922:#define cpu_list s390_cpu_list
> target/sparc/cpu.h:673:#define cpu_list sparc_cpu_list
> 

Thanks a lot for your review.

The generic cpu_list() was suggested by Richard on v5, so there're nothing
you missed. For those targets, there are target dependent output from
xxx_cpu_list() and the generic cpu_list() doesn't fit. So the plan is to
leave them as of being.

Thanks,
Gavin


