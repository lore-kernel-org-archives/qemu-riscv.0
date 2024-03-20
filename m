Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76BEC54E67
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 08:50:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmrdh-0001Ol-BK; Wed, 20 Mar 2024 04:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmrdf-0001G7-Uh
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 04:49:35 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmrdd-0000cg-0u
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 04:49:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4146e53d92eso1146345e9.0
 for <qemu-riscv@nongnu.org>; Wed, 20 Mar 2024 01:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710924571; x=1711529371; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kwuMerZlqcLAvNCnbAMlpvDC6HUJgNIZLa8N/0Eyd9A=;
 b=DGCLYuu3IagS0TvokiOiEStPVO1aFXtF3kXddVImRYoyHqSJ8ZGnz+zdNzhfKT3vJB
 g1Pc0er03HE3f0rUnOKBKo9/9a9Fwu6OxKhPgxfvIHBzMZHzIABNcQVpzwmJvjSdnHcs
 nP5SeeOmiB9a2I+lKJmCHj3qBhYw4jFZzSLdI5065HygtXdiJZm2jVr9lCOElQh5bMzl
 Ds5REFiZvV9ACQu3b5GOdEQdM9KL4DtIs8xVYII6oqQ2orThy6wRdJFt11fc0eiOxydy
 oxIUvwBdhlDuTYoWg1pibD4Ja02uylYG4iPVysZBzka0dxuI69ZFFHoThOjaOGRdwAPW
 /IbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710924571; x=1711529371;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kwuMerZlqcLAvNCnbAMlpvDC6HUJgNIZLa8N/0Eyd9A=;
 b=op3oio2VIaPEM82gtNOFJlQZJ83A9NOLVDkedQrxpNxVWHKmiRbctjgbcSdGMn3rnU
 ra6avhIxjSSoRpT2qjJMvDJlTXldeve7D0wrRE+/WConDmXf3iFftI9fZ7rIvmnPSuww
 XC535dDDgTa9o86c9/qgxjQoXMu7TcwuaTRj5X5TFRtL9yqpsSsx7F0S+oRHUDSyay2u
 DNdhB/9yBvkrNrNqT4oSd3QFuDfIHsRein1ZyB51VJYjcwoSVc1EA5EYNlCOm6QRwCFD
 q3ypF8iseG17Uk9ZBwSpEqbjpvay/clBTA1OwRDgbqZTAvVB834cU29VT76Le8Puj4JS
 Ybvw==
X-Gm-Message-State: AOJu0YyG54JiF6xC8rUqsGby03VbM0ghvQjSUlvgJpVsORv59cCDXHjw
 7rBKBV9RhDRZuPEQLkFlGMwM7IrsLoD+wWdUBbqoAQZrL3szX0x90Zh5ZXK57k4=
X-Google-Smtp-Source: AGHT+IHSkoFSa35/gO5aSlD16MfDuLfO6YJoD+u/ttMKcTKifS2QAHoCMVymCuyWoM4o9l2KuqBODA==
X-Received: by 2002:a05:600c:3b24:b0:414:6467:34a4 with SMTP id
 m36-20020a05600c3b2400b00414646734a4mr3648453wms.7.1710924571111; 
 Wed, 20 Mar 2024 01:49:31 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.156.105])
 by smtp.gmail.com with ESMTPSA id
 fs11-20020a05600c3f8b00b00412e5f32591sm1500432wmb.28.2024.03.20.01.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 01:49:30 -0700 (PDT)
Message-ID: <4d748527-07d2-4cd1-91c8-77042d4d02c4@linaro.org>
Date: Wed, 20 Mar 2024 09:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 10/21] qapi: Make CpuModel* definitions target
 agnostic
Content-Language: en-US
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-11-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240315130910.15750-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 15/3/24 14:08, Philippe Mathieu-Daudé wrote:
> CpuModelInfo, CpuModelExpansionType and CpuModelCompareResult
> are not restricted to any particular target. Define them in
> machine.json to generate them once.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   qapi/machine-target.json | 78 ---------------------------------------
>   qapi/machine.json        | 79 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 79 insertions(+), 78 deletions(-)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 5f17b25d50..0412400df3 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -6,84 +6,6 @@
>   
>   { 'include': 'machine.json' }
>   
> -##
> -# @CpuModelInfo:
> -#
> -# Virtual CPU model.
> -#
> -# A CPU model consists of the name of a CPU definition, to which delta
> -# changes are applied (e.g. features added/removed). Most magic values
> -# that an architecture might require should be hidden behind the name.
> -# However, if required, architectures can expose relevant properties.
> -#
> -# @name: the name of the CPU definition the model is based on
> -#
> -# @props: a dictionary of QOM properties to be applied
> -#
> -# Since: 2.8
> -##
> -{ 'struct': 'CpuModelInfo',
> -  'data': { 'name': 'str',
> -            '*props': 'any' } }
> -
> -##
> -# @CpuModelExpansionType:
> -#
> -# An enumeration of CPU model expansion types.
> -#
> -# @static: Expand to a static CPU model, a combination of a static
> -#     base model name and property delta changes.  As the static base
> -#     model will never change, the expanded CPU model will be the
> -#     same, independent of QEMU version, machine type, machine
> -#     options, and accelerator options.  Therefore, the resulting
> -#     model can be used by tooling without having to specify a
> -#     compatibility machine - e.g. when displaying the "host" model.
> -#     The @static CPU models are migration-safe.
> -#
> -# @full: Expand all properties.  The produced model is not guaranteed
> -#     to be migration-safe, but allows tooling to get an insight and
> -#     work with model details.
> -#
> -# Note: When a non-migration-safe CPU model is expanded in static
> -#     mode, some features enabled by the CPU model may be omitted,
> -#     because they can't be implemented by a static CPU model
> -#     definition (e.g. cache info passthrough and PMU passthrough in
> -#     x86). If you need an accurate representation of the features
> -#     enabled by a non-migration-safe CPU model, use @full.  If you
> -#     need a static representation that will keep ABI compatibility
> -#     even when changing QEMU version or machine-type, use @static
> -#     (but keep in mind that some features may be omitted).
> -#
> -# Since: 2.8
> -##
> -{ 'enum': 'CpuModelExpansionType',
> -  'data': [ 'static', 'full' ] }
> -
> -##
> -# @CpuModelCompareResult:
> -#
> -# An enumeration of CPU model comparison results.  The result is
> -# usually calculated using e.g. CPU features or CPU generations.
> -#
> -# @incompatible: If model A is incompatible to model B, model A is not
> -#     guaranteed to run where model B runs and the other way around.
> -#
> -# @identical: If model A is identical to model B, model A is
> -#     guaranteed to run where model B runs and the other way around.
> -#
> -# @superset: If model A is a superset of model B, model B is
> -#     guaranteed to run where model A runs.  There are no guarantees
> -#     about the other way.
> -#
> -# @subset: If model A is a subset of model B, model A is guaranteed to
> -#     run where model B runs.  There are no guarantees about the other
> -#     way.
> -#
> -# Since: 2.8
> -##
> -{ 'enum': 'CpuModelCompareResult',
> -  'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }

Otherwise I'm getting when linking:

   duplicate symbol '_CpuModelCompareResult_lookup'
   duplicate symbol '_CpuModelExpansionType_lookup'

