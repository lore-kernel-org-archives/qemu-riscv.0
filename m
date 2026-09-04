Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD936C61DD6
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 10:47:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2RSC-0001N1-Ta; Fri, 04 Sep 2026 06:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2RSB-0001Md-Kd
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 06:47:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2RS6-0005We-Bz
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 06:47:27 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 684AITSi3443337
 for <qemu-riscv@nongnu.org>; Fri, 4 Sep 2026 10:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gTqy9lzTnGoE7rdjuz0+mRgtWp64G5HtYCu9pzhFyVs=; b=KwNx3AHBoczxd2jL
 01wIVKgZ/WAt4K+uWs7qkd426Y1fGxntW4HugcboDZXZWF6PUydvtvglnoeeocDe
 BTlHkfT+pKu+JtlsBUoRg54KSLHI7ggnW/ZPhRmxW42b+X+3Jb5qtMV08es+2jZ+
 om87eAAJ1n9LCb4Hmi4rthXUC95enLl5QGROfXRUPRjUDgyhMlj0Yb4EssphAjZZ
 1RIfzc7yf0llTGrUdsIb+2aDWd7CdLhS7SpGgBKLF7khm7xigD+4B2Yve10/cXR9
 HncMSLu5pWCWhjM0mvXHRPnz9MxbQuhblEbkedTKKn+jUassHAWTeRAWUNFfRuP4
 UqvFPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp7819jh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 10:47:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9396e0515dcso48671785a.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 03:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788518840; x=1789123640; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gTqy9lzTnGoE7rdjuz0+mRgtWp64G5HtYCu9pzhFyVs=;
 b=UYFhtIMPJl5PJy7nQwQ/fgxPTd6vj/7gNMvyxtWt8yYgfPU9pZd5h4tCewiN772MiA
 RKice9Cjg1GgOUiS4xfGog9jKGDzPLTO/vIVK1mk2kTo0ZsSXM0NntW5OQgOX0Frd99d
 uMR4jTX+6icfMyBaUN1Jl5mPZiPIIJAHF5P1nYeQH0DdiT5ZgSF4nkNrjzzA+Rc4eMw1
 +xZX3B2GLc/fKqjG33Gf5vncwYdY0Ij8SgqBkuZ5BeqKimabwJk7MPgTaO9q+7vRjHoL
 Ns6OSDn1FgFWElf1VwqZyMdJQ1lCqKu9kg6NWzJJQSFEajKbRnhDzreUO1W+pAwZ7Jiv
 sS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788518840; x=1789123640;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gTqy9lzTnGoE7rdjuz0+mRgtWp64G5HtYCu9pzhFyVs=;
 b=tKyHkQYkoyNORPuxeEZ5V7KYvep4ZZfjLPMzsGp1e5rFhjhweVhcbxJoAUXeslaCFO
 NpUu4OTmGl10sHqRWZY7fQWQqY1AX8ewvQx8Uw+/3qwnd11SKOfi3rm0frY1oEuFmXwO
 D7YCCerjGXWp6EHDGFHLsvJM4R1PDG5IEMWp//rk/rmu5UjdjGgcTmLjq5Ktz4YkLflP
 x/PBAnWcYyye4mSv8sZbYrMzwm9gD0rXqV6aU4geIyTErMtuSf5Ga9gw9A1Nq5VCJyFG
 77YOKjVO+7YQJX4/tOLAwsBwQMBa+wPEtd2HKkq9JRcp8Hh1H20Ar4ngUQCrvAHFZWZ+
 fe0Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByknc80AZwENO5ewDJYEwin653hmphxMl/gWxf1VOuZ5ZT6XjCytldu+HYfWrLVIpvZIR5aw6toW2j9@nongnu.org
X-Gm-Message-State: AFuF++kEDxmnR3Q7ZStVxSxSG/YIK0Je6RJnq1xNIDPqGjvCv+RDou9/
 3STEv/WXQYa/WzqbS7At61l/FznbDdbI39BVGieOVGzOx7ZapcHiE0TGcZKo8Wp2q5yKBVYa9mr
 UjndYF47EVNzyv0Vcq18Zyn1ef6eiVU617v/kFLsXPqv3M5xHE8HSEbxe2Q==
X-Gm-Gg: AYBFou29J5FCb52P5HKTduzg0ahAy+g9UXi1Ec5zoKWzomYl0pZM2G7Uw+GiVBBFPId
 mNd/YBTLheUoMTrzb0j1Ud7+/pzOIhTBndG2Xk6RwYBVm1PVGflx+MA+rJ8MqJdzPqAhGS1cTpb
 CNOEy2HrerNq4JA5i+YZDre9hT1WwvQVSpUU2qoZHghyGfn+BCeP+IVPP1cPmnf9nyCA86S4R5L
 7R8t1I3517q/8xwRJRSNXLSrcyfM//iLTJGe1zk97/kFYlmVrJ4cES+n7UhFxVJYR8u46MuUis7
 +gr6K6VFlE51045upgdftyb36XOqeZZp+6PnA+9y2fCWAbcgayCYU0WwjU65Eu55Db7Qw2zooPt
 /Pe5c4EJCztI44AWciOkBoUGsEdiUK5BkEg==
X-Received: by 2002:a05:620a:1d03:b0:938:7751:c0fc with SMTP id
 af79cd13be357-93980539301mr523786085a.39.1788518840182; 
 Fri, 04 Sep 2026 03:47:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1d03:b0:938:7751:c0fc with SMTP id
 af79cd13be357-93980539301mr523781985a.39.1788518839761; 
 Fri, 04 Sep 2026 03:47:19 -0700 (PDT)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48588390e30sm5515771f8f.7.2026.09.04.03.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 03:47:18 -0700 (PDT)
Message-ID: <5d681d59-4a2f-4068-b36d-4ca40ab7b921@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 12:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/16] hw/riscv/atlantis: Extract an Atlantis SoC device
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260903055131.257903-1-joel@jms.id.au>
 <20260903055131.257903-16-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260903055131.257903-16-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5NyBTYWx0ZWRfXzArs8AHDV7v9
 psa0H+pP5+FkVjmWmXf4RpgfDC+nYmsmW1VkFRQyoqfHoS4vJArGbRe2DlbN2ph+cyeCr+9DfkU
 Ih7E3HF+S7rhf+a+mOV29qBPvmtXOwk=
X-Proofpoint-ORIG-GUID: vvL5kWqUxML92IKiYq6jIpkBR_PBA7qz
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9aa1b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=xLHwHkBS70Q2YpKRw3oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: vvL5kWqUxML92IKiYq6jIpkBR_PBA7qz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5NyBTYWx0ZWRfX/M94RpX4hI8N
 NWyLTuTYS9q7dIqlzgUW7wRCVT0LBmRvhNXCQSuHJQqqZ4H9VhTH+HskLTefCXz57MMj8ZoJOk8
 v/3qjLCSrZXAGjCd3Ik7L9hD4vsPqOkZ7yvvDbA9xoVp0B3bOc5QSCYPTViVNkn8LcBhaeG4/Lh
 cZptZnjqwYuHXS7lTPYkTm6um6+iPglkrkKfVVoTA7o+IXCOV7tpXwaTCsq484qrIyYkn2b+6IQ
 sHoR/3zv19zWkEACfCmEjNGtNbV9lPAxj6Sg3/roiQktpsPBua1eRyBeuIU9AilOaAZ6L9b7KVG
 th8a+OLlpiEeNz2Y4hj92bHOX/Vorr3ZMQm7DHPrOO912UKT2xg1Gff2ZnQiBWiBhWjaXuAmOZj
 Ia12l6eHbH1zURr39+exkII590EgvnU6rmDNs8UOHGbe1xXW0nlkvu4q8Z1P8YLESq8LIoPMNcy
 y8ubrNbGF47yrAvItSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040097
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 3/9/26 07:51, Joel Stanley wrote:
> Introduce TYPE_TT_ATLANTIS_SOC and move the hart array, AIA, ACLINT,
> boot ROM, UART and I2C controllers into the new TTAtlantisSoCState. The
> machine keeps ownership of RAM, device tree generation, firmware
> loading, and the board-level I2C slaves.
> 
> This makes it easier to compose the SoC into a more complex machine in
> the future.
> 
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/riscv/tt_atlantis.h |  21 ++++-
>   hw/riscv/tt_atlantis.c         | 144 +++++++++++++++++++++++----------
>   2 files changed, 119 insertions(+), 46 deletions(-)


> -struct TTAtlantisState {
> +struct TTAtlantisSoCState {
>       /*< private >*/

While here please drop these legacy private/public comments (QOM
style doesn't want them anymore).

> -    MachineState parent;
> +    DeviceState parent;
>   
>       /*< public >*/
> -    Notifier machine_done;
>       const MemMapEntry *memmap;
>   
>       MemoryRegion *memory;
> @@ -39,6 +41,19 @@ struct TTAtlantisState {
>       DesignWareI2CState i2c[TT_ATL_NUM_I2C];
>       UnimplementedDeviceState uart1;
>       MemoryRegion bootrom;
> +
> +    uint32_t num_harts;
> +    char *cpu_type;
> +};
> +
> +struct TTAtlantisState {
> +    /*< private >*/
> +    MachineState parent;
> +
> +    /*< public >*/

(Ditto).

> +    Notifier machine_done;
> +
> +    TTAtlantisSoCState soc;
>   };


> +static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
> +{
> +    TTAtlantisSoCState *s = TT_ATLANTIS_SOC(dev);
>       ram_addr_t lo_ram_size, ram_size;
> -    int hart_count = machine->smp.cpus;
> +    int hart_count = s->num_harts;
>   
>       s->memory = get_system_memory();

For machine layer this was OK but now this is SOC layer and might be
provided by machine layer via linked property. IOW this should be
handled like s->dram below.

>   
> -    s->dram = machine->ram;
> +    if (!s->dram) {
> +        error_setg(errp, "'dram' link is not set");
> +        return;
> +    }
>       ram_size = memory_region_size(s->dram);
>   
>       s->memmap = tt_atlantis_memmap;
>   
> -    object_initialize_child(OBJECT(machine), "soc", &s->cpus,
> -                            TYPE_RISCV_HART_ARRAY);
> -    object_property_set_str(OBJECT(&s->cpus), "cpu-type", machine->cpu_type,
> +    /* CPUs */
> +    object_property_set_str(OBJECT(&s->cpus), "cpu-type", s->cpu_type,
>                               &error_abort);
>       object_property_set_int(OBJECT(&s->cpus), "hartid-base", 0,
>                               &error_abort);
> @@ -505,7 +524,9 @@ static void tt_atlantis_machine_init(MachineState *machine)
>       object_property_set_int(OBJECT(&s->cpus), "resetvec",
>                               s->memmap[TT_ATL_BOOTROM].base,
>                               &error_abort);
> -    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpus), errp)) {
> +        return;
> +    }

Patch LGTM otherwise, thanks!

