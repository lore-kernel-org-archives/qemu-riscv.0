Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7320C5AC7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 15:12:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsMF2-0006As-Fs; Fri, 07 Aug 2026 11:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsMF1-0006Ae-Hc
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 11:12:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsMEz-0004gO-Ak
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 11:12:11 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 677DdWmS849577
 for <qemu-riscv@nongnu.org>; Fri, 7 Aug 2026 15:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XR/2cuWnIPLe2HNUK7p7MjclOFkLGz6vzavnYvcztmM=; b=SF2cDcMHRi69Zod0
 Ghsz5kZf4mOcVg8ra8Vj8oXrCW0kxYJ+CEoNAPh/SDuF8K9x701kHvvVDXY5DWls
 AVx7EGjzkyQOOXIok6aYkzcymeGt/LN2XT2OCrQ9C9SQ/B1veB55yLPLZ6gII45E
 gfB8mo6L72FBvxT2T18Ge8dbuOQtHYcb/IhXSg8SgHcOcddKCfhRmqH55n/dsH+y
 AJRne/70K+iiq4gIJbSpk8i7WJXtVNDiDNaTRlMSRT5S5VvInbjkimIEJLeTX/No
 XAJvsV54DrYi8t4UbrT50sSx7dbU4Ad1obCQznX3iMZImLaGsZDNw65pG4mNAX/m
 wVDT6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgem8d00-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 15:12:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e53b8a302so377966685a.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 08:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786115527; x=1786720327; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XR/2cuWnIPLe2HNUK7p7MjclOFkLGz6vzavnYvcztmM=;
 b=jsjfF+nC+AzNFn8EVsOa2HrJtexznBHktiWfZAzXQyVOrmYyE3/ONl5lft02pGFoKg
 F/upjgm7vySqGjV672Bxdi2WWBmIBqGj6Xj5r2YL6uK91m5CB9ao19eca3xZHiS8H/e/
 4W8UJXmeuauk+mqhqqNZQlYpKzlk7sYVSQzTb+uBlymyYyAAJkQXYoKmirnc4sTfMT7o
 x+9CkxBjY5Sf3y4WF/rTMcJNk5EHxY0UNKLFT/+Ap+haly77MLFoIQKMJZbpxCk6U2od
 Hj4t8+vJK97+1WHLcbB8J8HoBXwJnxM24CjqcCOoE+VhzBUELcDkMKi9YsKKv8kqxKzl
 5Q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786115527; x=1786720327;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XR/2cuWnIPLe2HNUK7p7MjclOFkLGz6vzavnYvcztmM=;
 b=Z+cAba4yxChY6dTIUAsBI1tTX3yVOQU/pnV18RwJ2pXKus1MB4yWT1rMDkyc6C7h0l
 3A+7aTxrYO/jOzbcIgewjyT9pMMFNyBqpjeqYfih9NYBYiKktqibtdJgcjNhQs1cnvOb
 ZYAgeE7OAhzO9AjPp4mrb56RTsRB3kntog0IHJ5OKskbmYfCynxkpNSoaFJ7KsxHrKTN
 CRGzaOf0rXLu+qkQY1b+JMMAkQkwr9YOhiHEJT0b7cZz+PzLOCXVLv71rrUjmmZbQMgZ
 limMd8qqyufW5gy4ankzvvuHrDU+ocZFp4NsFoLiWh/4m9RanbG7xH4Fowx0nOTNQbok
 mEmg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq/0MRYWbBuqcoD5XF0CRk/BtvPW1SIyRfAINYQ8SvvqomiK1BImdXqOWnVPVk4hXw5PvVP++FDmYLw@nongnu.org
X-Gm-Message-State: AOJu0YxNowjMNpKuAkbpfgLrlgBE5AT2bxWFnyiKcJzqYScheoYo8XKw
 sapcqE5aZooZQ/oOv/mRycCODESXANtgav9UOcSSfLa0T7vRL5+pFiMXr9CgPU/YcUF7JbOE64W
 w99wgtQ8yXvzo6nbcDZ9RTFhFUOjZ7fquH29lLpB9Z/ilDAmraFgwsA0UZQ==
X-Gm-Gg: AR+sD12Rs7WKtZFXB1ZExDZF8UKLKpnpdhrOlxfP9D3742PzWc/+6XJCbSer/YzqTMc
 ALI2pAtPp6VFktfnwrgaBBIJUJw8Wfhj7oemdIhXnBYEXyiaDV7QnSUTYf2d196C+8H51EKI/r8
 S9ixvYXs7uOHICz80k/evJR4hJMz85htlw5O6zn5pQlSs2gk9lU2Zz/8/0PtskNuOCo8ovuyrv7
 xgxxgqCpX5FoHQiEiAK8Vzq30ToqY+kN3MC+aKb67jxMfgIkEebSmCNLH01nW1Zppv7OqMMfYYC
 d4BEo/F57C5J6eC8w/HfLTxU/jVG601+QJkRloCIYdtvVdnnIojhOrwwM2qtZjRSLAhKyHaTQrP
 vvQxDOjJMO5pvkvnH7yFzsy91fVPFnQ6lWFVP
X-Received: by 2002:a05:620a:a004:b0:930:f554:40c with SMTP id
 af79cd13be357-93648ff052amr2182993585a.14.1786115526721; 
 Fri, 07 Aug 2026 08:12:06 -0700 (PDT)
X-Received: by 2002:a05:620a:a004:b0:930:f554:40c with SMTP id
 af79cd13be357-93648ff052amr2182984785a.14.1786115526289; 
 Fri, 07 Aug 2026 08:12:06 -0700 (PDT)
Received: from [192.168.68.104] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9366e032303sm168811185a.9.2026.08.07.08.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 08:12:05 -0700 (PDT)
Message-ID: <9c8ca1aa-de8e-4ca2-93b4-df10e6e4ea81@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 12:12:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] target/riscv: Enable Zicclsm for the compatible
 CPUs
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
References: <20260805164345.698208-1-frank.chang@sifive.com>
 <20260805164345.698208-3-frank.chang@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805164345.698208-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X7lnGOfeCGZKY1Wic2ImS9yI9JmpNphW
X-Proofpoint-GUID: X7lnGOfeCGZKY1Wic2ImS9yI9JmpNphW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDExOSBTYWx0ZWRfX/b++68RZ9LR6
 qUoBhsrq42zniqAZhWOoL5TUyEf5/ZuLZot/cHXQTiAWbMJYxFaArFInl1H79ll52obMf7xMD2Q
 k+jPD9KZSHaI5x3llSCa9CwZzzx0D08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDExOSBTYWx0ZWRfXyg7B7dZ3/Z4y
 C3WJUgQKyqXi+OTOaySRXzu+ZEiuLpKDGB9/dlHoGBNInZuK442dLg+HbHC1FcFrkcSHCDs1aQ1
 eq8+kL+5+o4B/u3UXrnJLGUy2Ow1BWuDiMquSsG57aPHb6JhVUYfo9jQJNqL6XTy+MmNtkHOSa4
 CiXrSnYd9Byfw2O7BptjNbK+Tz9lxLh1hZGLJg6y+MEqu7sOUPvO53i6wZVr8/E4gpJngWfZqXC
 3RTUoQj8iyMjbvJPzDyicNHLQxKodevHkJ681o1BkIITi6G/gUz/+ctoRiaeK5VM6e3v0Rc5zsm
 lTGePK9VSYHsi1U0Myui1HI1G5HImXaWmlYr8gItIV2iplCYwHYMqlEjzSduijJfZHbLXURNEhl
 Sbdt5ePjJu0zXaSpQgwIt9rmXjyasaYB2tbK8WPlstesVkw206wlIAG53vHhXOyiPwIFc3lk/0s
 VOw4MVDj4jZtst8jAvw==
X-Authority-Analysis: v=2.4 cv=X9Ni7mTe c=1 sm=1 tr=0 ts=6a75f5c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pFyQfRViAAAA:8 a=JF9118EUAAAA:8 a=EUspDBNiAAAA:8 a=_HahZhrRswo1gu_DB80A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=oJz5jJLG1JtSoe7EL652:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070119
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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



On 8/5/2026 1:43 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> To support Zicclsm, let's enable Zicclsm for the following compatible
> CPUs:
> 
> - Base 32 CPU (to be backward compatible)
> - Base 64 CPU (to be backward compatible)
> - XuanTie (T-Head) C908
> - Tenstorrent Ascalon
> - Ventana Veyron V1
> - XiangShan Kunminghu
> - MIPS P8700 (ISA doesn't include Zicclsm, but their datasheet claims that
>    it has unaligned load/store support in hardware)
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> ---
>   target/riscv/cpu.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5a82e6563bf..7ee89f6fc4b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -3268,6 +3268,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .cfg.ext_zicbom = true,
>           .cfg.ext_zicbop = true,
>           .cfg.ext_zicboz = true,
> +        .cfg.ext_zicclsm = true,
>           .cfg.ext_zicntr = true,
>           .cfg.ext_zicsr = true,
>           .cfg.ext_zifencei = true,
> @@ -3340,6 +3341,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .cfg.ext_zicbom = true,
>           .cfg.ext_zicbop = true,
>           .cfg.ext_zicboz = true,
> +        .cfg.ext_zicclsm = true,
>           .cfg.ext_zicntr = true,
>           .cfg.ext_zicsr = true,
>           .cfg.ext_zifencei = true,
> @@ -3426,6 +3428,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .cfg.ext_zbs = true,
>           .cfg.ext_zkt = true,
>           .cfg.ext_zbkc = true,
> +        .cfg.ext_zicclsm = true,
>           .cfg.ext_zicsr = true,
>           .cfg.ext_zifencei = true,
>           .cfg.ext_zihintpause = true,
> @@ -3469,6 +3472,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .cfg.ext_zicbom = true,
>           .cfg.ext_zicbop = true,
>           .cfg.ext_zicboz = true,
> +        .cfg.ext_zicclsm = true,
>           .cfg.ext_zicntr = true,
>           .cfg.ext_zicond = true,
>           .cfg.ext_zicsr = true,
> @@ -3518,6 +3522,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>   
>           /* ISA extensions */
>           .cfg.mmu = true,
> +        .cfg.ext_zicclsm = true,
>           .cfg.ext_zifencei = true,
>           .cfg.ext_zicsr = true,
>           .cfg.pmp = true,
> @@ -3577,6 +3582,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>        * The RISC-V Instruction Set Manual: Volume I
>        * Unprivileged Architecture
>        */
> +    .cfg.ext_zicclsm = true,
>       .cfg.ext_zicntr = true,
>       .cfg.ext_zihpm = true,
>       .cfg.ext_zihintntl = true,
> @@ -3633,6 +3639,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU,
>           .priv_spec = PRIV_VERSION_1_12_0,
>           .cfg.max_satp_mode = VM_1_10_SV48,
> +        .cfg.ext_zicclsm = true,
>           .cfg.ext_zifencei = true,
>           .cfg.ext_zicsr = true,
>           .cfg.mmu = true,


