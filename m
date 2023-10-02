Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF766E74905
	for <qemu-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 18:27:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnNdH-0004MG-4Y; Mon, 02 Oct 2023 14:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qnNdF-0004Lf-D7
 for qemu-riscv@nongnu.org; Mon, 02 Oct 2023 14:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qnNd9-0001RP-Mz
 for qemu-riscv@nongnu.org; Mon, 02 Oct 2023 14:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696271214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXN27XwzoteD60cMt972kXTJ4T9Ibx9y54Nbbx/eMUE=;
 b=RPz/NOm23ZkzRSGgC+GVFEfT/Ys499M4ry5rf4u/mytG0DZlWIo/dxZrxoQNEBpMSwzoB1
 8ZoVUFt6OZ25FqNiJ+26fQ4RHm1lP5bGuvXvWffXV/nRgETg2LDHR1IBO8Vy1hdMVrGrWf
 H+ihUic9ZcjzPIADw2T3DFOPMwmlBnE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-z0_R0cc-MRWflNda3CEhFA-1; Mon, 02 Oct 2023 14:26:51 -0400
X-MC-Unique: z0_R0cc-MRWflNda3CEhFA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-65afd7515aaso870006d6.0
 for <qemu-riscv@nongnu.org>; Mon, 02 Oct 2023 11:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696271211; x=1696876011;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fXN27XwzoteD60cMt972kXTJ4T9Ibx9y54Nbbx/eMUE=;
 b=asmwXeA3E/SfquieS2/sIVxWL03XnNSXmTV8hMhUqKwvKzjEg8t57oCm5hAlOljLaT
 51KYQjkaMEB3QC3PePzq9oaJMax6VDDA6yAAHQ9o8tKZMNKoeOsnh/4K5U8paeWC+88A
 o2o25OaysguetnclDFSgWrGGFh/aJSqERUAoWLF3F+PEUZqrXdXWHk8lljgZF8mDtDIc
 A7w8HFQsyt9CzqUCoGdFwkIZwgSAIJXtEMssP58/TTpg80UnczdXyi68kCwr6c0Ew2DN
 wpujo5Tjk8pybGUydWCrRdVQ7C8Icl19Ex/2FnRNNGkm1zFxGRakI841lPO5XCATlun+
 Qk6g==
X-Gm-Message-State: AOJu0Yz4H7DaWWSoUy2XbQf/NqB2/2EaBLhDcB+hfS5Z3t1EgILIH8Rm
 hB2rZ+EmcICN8/Q+3r/wXnA44v/tUhAR6PBkyJkIpo6yy7+kedSGVw12JMRW/isKrBaz8ki52JA
 xlr6DUzlywK7DwmI=
X-Received: by 2002:a05:6214:460c:b0:647:2a0e:573f with SMTP id
 oq12-20020a056214460c00b006472a0e573fmr12904165qvb.8.1696271211057; 
 Mon, 02 Oct 2023 11:26:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0eQDQG7qEiTg5QVP5UAVh0bJ7AYoEB057pM5tDI/opzhM794syFBeqY1iPNBeWHmB4xqaNQ==
X-Received: by 2002:a05:6214:460c:b0:647:2a0e:573f with SMTP id
 oq12-20020a056214460c00b006472a0e573fmr12904150qvb.8.1696271210755; 
 Mon, 02 Oct 2023 11:26:50 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-123.web.vodafone.de.
 [109.43.177.123]) by smtp.gmail.com with ESMTPSA id
 p18-20020ae9f312000000b007756f60bcacsm1871925qkg.79.2023.10.02.11.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 11:26:50 -0700 (PDT)
Message-ID: <3d754a9a-a854-f71f-e5e8-c133d23a3cd9@redhat.com>
Date: Mon, 2 Oct 2023 20:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add section for overall sensors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Corey Minyard <cminyard@mvista.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>,
 Peter Delevoryas <peter@pjd.dev>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230220110235.24472-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230220110235.24472-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.321, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 20/02/2023 12.02, Philippe Mathieu-Daudé wrote:
> Sensor devices depend on some bus, not a particular board.
> While merged for a particular board, sensor devices don't
> depend on it. They depend on a bus technology, and can be
> used by any board exposing such bus.
> 
> In order to help merging sensor patches, when they fall out
> of a particular board tree, add a section covering overall
> sensors, to help out with patch review and merge queue
> handling.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Hi, would you like to help co-maintaining?
> 
> Cc: Titus Rwantare <titusr@google.com>
> Cc: Hao Wu <wuhaotsh@google.com>
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Corey Minyard <cminyard@mvista.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Kevin Townsend <kevin.townsend@linaro.org>
> Cc: Klaus Jensen <k.jensen@samsung.com>
> Cc: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> Cc: Peter Delevoryas <peter@pjd.dev>
> Cc: Cédric Le Goater <clg@kaod.org>
> ---
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd54c1f140..657fadbd6d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3255,6 +3255,12 @@ M: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
>   S: Maintained
>   F: contrib/elf2dmp/
>   
> +Overall sensors
> +M: Philippe Mathieu-Daudé <philmd@linaro.org>
> +S: Odd Fixes
> +F: hw/sensor
> +F: include/hw/sensor
> +
>   I2C and SMBus
>   M: Corey Minyard <cminyard@mvista.com>
>   S: Maintained

Reviewed-by: Thomas Huth <thuth@redhat.com>


