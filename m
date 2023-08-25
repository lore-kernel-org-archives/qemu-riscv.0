Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E856FC3DA6F
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 14:16:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZXbM-00084p-FH; Fri, 25 Aug 2023 10:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZXbL-00084Z-Au
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 10:15:51 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZXbI-0003ch-V4
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 10:15:51 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5711f6dff8cso589783eaf.3
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692972947; x=1693577747;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tyDDdZMp8OmmMAS0JLJ42t5WsWpvoiRAVIj9BGgMdvc=;
 b=PS8+FBtLs7X0rZQc03v2iHwpacZyy7lAJ01aEkakRiXn0EHYc1Ko7ehOtM6jKfclq6
 IhAC616LZLl+8S/j3/MWVyu6STJ8jBGyJfWSYNj/hagC7LCE4bXLmpRR8TPGGb/PdcYk
 A1jbFdd0H6coAvHih9Q5OfxNs4CsUlksVRdLpSA2SfdD90XFPWBfHy5ixuyzhwOaCkDQ
 XizJVdVl9iRWk53fBkb295mxijwK1FFeJ7emo+ROYL9ujDcUk7ep5JDvViVaMio5O5Oe
 njrARh7PfWslm6W8lxy++c9+Z/DH1Qs1k2v3dvHf73eZqSYU+98lCkIN0FzMcTwfghns
 kBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692972947; x=1693577747;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyDDdZMp8OmmMAS0JLJ42t5WsWpvoiRAVIj9BGgMdvc=;
 b=GvBSUsAnaOEpL0m5hi3+CZ8T/K54UVbLnsdYnq1tqTSbSZEfiGdjlwXNAZ2IsciOHu
 sxrTj/cgQ7Qs0fOlX5CGfhHNzDK4fk2p+gMtudhBBZlehiffNbTeTPAFUs8RBz+QQ0e6
 1HnaXqo/RRwvPp/3kbJRgsX4yBYjhsE+mvTBuDDhNJY17Kz4oVX1Rn91kKInF5BvUtgR
 C94iZG23vEOdAHJHTY30c6lfveTfAxOqdqjb3R1gfeseQAFG5te+5+QMl+QJY4hcBpEN
 BqanWv4RK8MW5oj/PXkRIrFRMCBhF0+b39a8lRwf4HS0WnqEtcmYvQVoKpFrgOWJ40y7
 +yNw==
X-Gm-Message-State: AOJu0YwFiEv8WL6Jz3O/1WuVd+P5GogXm0t13mTVrhE/KQFjhwnIt+wQ
 /PPl62aZg6bJ3s4CPbKUwkuf5A==
X-Google-Smtp-Source: AGHT+IHnFagtVLmi0YggWyLSorn3ye88nstkxO5hnCa6SZ8ePkt92k8OJezGZUxF0zFNI2+0zoxuhA==
X-Received: by 2002:a4a:7548:0:b0:56e:14b7:b053 with SMTP id
 g8-20020a4a7548000000b0056e14b7b053mr4666709oof.7.1692972947553; 
 Fri, 25 Aug 2023 07:15:47 -0700 (PDT)
Received: from [192.168.68.108] ([179.93.21.19])
 by smtp.gmail.com with ESMTPSA id
 ay3-20020a056820150300b0055ab0abaf31sm898729oob.19.2023.08.25.07.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Aug 2023 07:15:47 -0700 (PDT)
Message-ID: <3c05475f-0eb9-e720-55f4-d21909190be9@ventanamicro.com>
Date: Fri, 25 Aug 2023 11:15:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 0/3] Add API for list cpu extensions
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 richard.henderson@linaro.org, pbonzini@redhat.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, ajones@ventanamicro.com
References: <20230825121651.1534-1-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230825121651.1534-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.57,
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

Hi Zhiwei! I have two observations:

- this API doesn't play well with KVM as is. In a KVM environment, asking for the
enabled extensions of the 'host' CPU returns:

$ ./mnt/qemu/bin/qemu-system-riscv64 -cpu host,help
Enable extension:
	rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintntl_zihintpause_zawrs_zfa_zba_zbb_zbc_zbs_sstc_svadu

This is the same set of extensions enabled in the 'rv64' CPU for TCG. This is
happening because they're sharing the same code that creates properties.

If I apply these patches on top of the "split TCG/KVM accelerators from cpu.c" I
sent earlier, this happens:

$ ./mnt/qemu/bin/qemu-system-riscv64 -cpu host,help
Enable extension:
	rv64

For TCG only CPUs (vendor CPUs) the API works even on a KVM host, regardless of
applying on top of riscv-to-apply.next or those accel patches:

$ ./mnt/qemu/bin/qemu-system-riscv64 -cpu veyron-v1,help
Enable extension:
	rv64ch_zicbom_zicboz_zicsr_zifencei_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt_xventanacondops

It seems to me that 'cpu help' doesn't engage the KVM driver accel_init() function.
If we decide to go ahead with this API we'll need to either figure out if accel-specific
initialization is possible. If not, we should declare that this API works only for TCG.


- I think the presence of the 'cpu help' API limits the command line parsing altogether,
making cheeky things like this possible:


(disabling extensions in the cmd line and asking the extensions)
$ ./build/qemu-system-riscv64 -cpu veyron-v1,icbom=false,icboz=false,help
Enable extension:
	rv64ch_zicbom_zicboz_zicsr_zifencei_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt_xventanacondops


(silly option ignored)
$ ./build/qemu-system-riscv64 -cpu veyron-v1,lalala=true,help
Enable extension:
	rv64ch_zicbom_zicboz_zicsr_zifencei_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt_xventanacondops


This is not a gamebreaker but something to keep in mind when using this API. Thanks,


Daniel



On 8/25/23 09:16, LIU Zhiwei wrote:
> Some times we want to know what is the really mean of one cpu option.
> For example, in RISC-V, we usually specify a cpu in this way:
> -cpu rv64,v=on
> 
> If we don't look into the source code, we can't get the ISA extensions
> of this -cpu command line.
> 
> In this patch set, we add one list_cpu_props API for common cores. It
> will output the enabled ISA extensions.
> 
> In the near future, I will also list all possible user configurable
> options and all possible extensions for this cpu.
> 
> In order to reuse the options parse code, I also add a QemuOptsList
> for cpu.
> 
> 
> After this patch, we can output the extensions for cpu,
> """
>   ./qemu-system-riscv64 -cpu rv64,help
>      Enable extension:
>              rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zba_zbb_zbc_zbs_sstc_svadu
> """
> 
> Notice currently this patch is only working for RISC-V system mode.
> 
> Thanks Andrew Jones for your suggestion!
> 
> Todo:
> 1) Output all possible user configurable options and all extensions.
> 2) Add support for RISC-V linux-user mode
> 3) Add support for other archs
> 
> 
> LIU Zhiwei (3):
>    cpu: Add new API cpu_type_by_name
>    target/riscv: Add API list_cpu_props
>    softmmu/vl: Add qemu_cpu_opts QemuOptsList
> 
>   cpu.c                     | 39 +++++++++++++++++++++++++++------------
>   include/exec/cpu-common.h |  1 +
>   include/hw/core/cpu.h     | 11 +++++++++++
>   softmmu/vl.c              | 35 +++++++++++++++++++++++++++++++++++
>   target/riscv/cpu.c        | 10 ++++++++++
>   target/riscv/cpu.h        |  2 ++
>   6 files changed, 86 insertions(+), 12 deletions(-)
> 

