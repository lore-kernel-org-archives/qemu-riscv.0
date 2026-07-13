Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01894C44508
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 07:12:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjApj-0000ni-1N; Mon, 13 Jul 2026 03:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjApJ-0000n6-NX
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 03:11:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjApH-0007Rl-91
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 03:11:41 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D6Nw3p390874
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 07:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UOux+gfYDB/athIATxfWWzN7ePScEoTb/XlaAPO8vfM=; b=KVGSDlaaKCd/PgZc
 Zlsf5gwky58bREzaxm+VEBgD+uGT7pP5hxXN6AW0+tKVyrsyJGvt2KwWYtvZTxdW
 1HvAsJODj8a684KzDxDkmP6RHhRmckhg7pETNC6E7iYtrjuHEmi+dWOAApnzVmU4
 AH/OFEf+LAEBvJ7wEoD5vbRZ8bO5ZvH2nAJNIbUx8ysm3ItiChRr5ysw++yp4QXa
 wGtUt51/U8RaGQ9XD59f5tSE4l8zHjeJi4GiG8BR5qZFxyesI0x1SEnu5Z7XLoM5
 Qih6UBNdmak5f7IT71Ge7yI86ZoIYpJ+INMmRtob6O2gtGCOWelZ2VfO/wMCB+iK
 MsnGfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gmsj3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 07:11:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bec738909so23154331cf.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 00:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783926697; x=1784531497; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UOux+gfYDB/athIATxfWWzN7ePScEoTb/XlaAPO8vfM=;
 b=Fwo6urkZipbTmSU7olERNd7hfvI8U60mxX4VhNlZlH76YKMquFn7BGFf7zDwkh9nd4
 sUDZqdGQ1St0UlrcCx0h85KbwUtUQocSBDJXA3HpLVzWHB15pRUU3zZkpgAlCl9ZY13H
 CNpdlU5h5yDjuYuroHCWzDxeKHqfJNlSqyWp0bBByrHJXolEkXGi7rR+hz3shnZ/dtbZ
 e5etDbRmMtGn0+uMsz/YlRV8ScUxonTIedGR8+rePbuBttMhfDyfWYAygi3OiFXZsJVT
 0cBSdn5MjjppZSyNh7qNwbPs1lqWhXphcoX3un1hEC9xjEzdL3ycRfOJ51ex3CKMkzJ3
 GtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783926697; x=1784531497;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UOux+gfYDB/athIATxfWWzN7ePScEoTb/XlaAPO8vfM=;
 b=l4HTRuJn31kZdCSPUHBiwo52gZdxNqeBvW4//eoeqZsTiI1NuPfbExoMDDUtdjT1io
 XL7PrM6SJY9LQOh8mq5T7vN5h1HtTgTJZsWZBTBV2oM2h+neHUmHjCP2agWZg47nNji1
 XuqbvRZdOkHLymqTDORIbnVV8T/xkI6ayKQjqb8RM+K3bSQWsWxO/EIZL2pLAyLPg8lv
 b5QAnKKE+3zzJsyQs46fmze/Lrj7i81PZzEffjYYWh4acNNpWeFHbuPBtVb76d3iFdzy
 QjvREtxCseKyuvjb7ro5PNdZSkuvpwZMo3818N8hxXv/OpvfF9bszs5qlFNMeE2vX+D2
 CB2w==
X-Forwarded-Encrypted: i=1;
 AHgh+RopURJf1EH6v8myhTH8R4UgLn2PwrjHTrWQZuH5u0m9pS2MvZBKj8TnCbt8v477BmgaJK3KkSh9hgf/@nongnu.org
X-Gm-Message-State: AOJu0YxlffbOYJcqtq5h6aKB1J/U+bfrQm4XFDDcx8n7DfDWkJq3D3Mh
 X5oKygsj8+9gY2nW3MH4WaEVEwNvjOa/7qMQLLU2DyS2rDVs06AQ34JQTjqx5NgKpWqo4My1yCr
 Hkl1xOAj357mf8rPTQEjPm6fp4CC/amGL3+uJ912TnBY7wHYoW6mqWGFJjA==
X-Gm-Gg: AfdE7cklSUSRS+mkXZPTZHTilAhrfEJ2kTx8nQQYl7GB3mEP0iP8sjilpX5vrF9TPAc
 Y4DqtBsnxPTb0pHioJiz7mW33MbSGKomVFByx55nPO0leaCkcbbBDTg3pNxogoBpl7BrVRSt1aP
 0BAQi1lYlMCkCaEraEuifodhR8oJaNQ2YYatMeTWU6G68BU0AmN/zQf29T2yu52CuZ0/xgOKZ8d
 AMwzXkPJfmo+rOJ/gARVmnuROFO1kOEpP6pL2MQ/mNCI02OIi+k9nr3lnDQTofT+XrcmuABpRCO
 /dJJ9zEOisMgvBQEDt4V+9LO8havIdkwdmEKjzu4sQOkJZjjEMJHAPKvUEfyyJjQlGl7dW3avGq
 muabHZTI1Tn200L9dPhst1qKCA8BC9WdCm2KnlbDWYcT//26ipYW5XdYzevxW8A==
X-Received: by 2002:a05:622a:5513:b0:517:87bc:9b47 with SMTP id
 d75a77b69052e-51cbf140e43mr75364631cf.39.1783926696733; 
 Mon, 13 Jul 2026 00:11:36 -0700 (PDT)
X-Received: by 2002:a05:622a:5513:b0:517:87bc:9b47 with SMTP id
 d75a77b69052e-51cbf140e43mr75364481cf.39.1783926696349; 
 Mon, 13 Jul 2026 00:11:36 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f373csm569297455e9.14.2026.07.13.00.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 00:11:35 -0700 (PDT)
Message-ID: <650b9d5c-ca79-447c-b91d-a83d017f42a6@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 09:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: Mark "vhost-user-scmi" orphaned
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 alistair23@gmail.com, qemu-riscv@nongnu.org,
 bin.meng@processmission.com, mzamazal@redhat.com, sgarzare@redhat.com
References: <20260710114305.2961898-1-armbru@redhat.com>
 <20260710114305.2961898-3-armbru@redhat.com>
 <20260711035848-mutt-send-email-mst@kernel.org>
 <65079ad4-3ab9-4ad6-b683-09d46c72b266@oss.qualcomm.com>
 <20260713025003-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260713025003-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a548fa9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=69wJf7TsAAAA:8 a=39ZlauuWbp4OStpUMHcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: Qhmw-kk93LyTmNPRsKv4fFjSt9UrJhGJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3MiBTYWx0ZWRfX/2at2QHV9u+H
 3i+ngChmYab6Z6/9oBEN9wqKiBK+BfOXAACSZf1dKfYxonnpgf6L1qxsAZxg0AHwOUQ8RkHSSGC
 gsvY0rqkR9wpsampeH/sgCXTLkc216k3htlkjNXBx8H6v/QKhyAKGCU55r8lEfFS6ftDksUneEt
 CJFk/1JHkcEiWb4uxwte4f1a79R98mRa1SsI9TQZfugz7wCoJlniAGXjfoOGKWrfrpFY0pS/FQA
 wxaeBx0JooBrx1I4BXa7ABL/A/ggfHaBgETFRTTE6owCPR/JXfL9T6PwHX8yxOHCsw73dViEIHz
 47to6F4A0Oj1UZJqG/A15C1h45R8xXsVVKQgIW4sAlsKPFXsdk6L5whKry8Wd+ze7phYfktizaZ
 XU4xI7V5uoe172ZvWu4bPe+indRsbPzfZR91YorqLB8n57gA2oL6iN0SsWxj9fDksZj+gIVnwF0
 4fKb1OqGmeTPEy61mIg==
X-Proofpoint-GUID: Qhmw-kk93LyTmNPRsKv4fFjSt9UrJhGJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3MiBTYWx0ZWRfX0f9bycKGM/ES
 xxqY7JBFBkFx4eSiEWun8GJfOzXAD1sFSTuAhiJPZxmFUNU/ujfCb/N6oDPphIwKXGhiD8Eh/1+
 naB8x0lnnF3RsElZiZxcAM7dRLG3jYw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130072
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 13/7/26 08:52, Michael S. Tsirkin wrote:
> On Mon, Jul 13, 2026 at 08:13:38AM +0200, Philippe Mathieu-Daudé wrote:
>> On 11/7/26 10:00, Michael S. Tsirkin wrote:
>>> On Fri, Jul 10, 2026 at 01:43:05PM +0200, Markus Armbruster wrote:
>>>> Commit a5dab090e1 (hw/virtio: Add boilerplate for vhost-user-scmi
>>>> device, 2023-06-28) added the section with S: Supported, but no M:.
>>>> This makes no sense.  Downgrade to S: Orphan.
>>>>
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>
>>>
>>> No, this makes sense. The reason this section was added is so that Milan can
>>> get copied on vhost-user-scmi but not other virtio stuff:
>>>
>>> ./scripts/get_maintainer.pl -f hw/virtio/vhost-user-scmi.c
>>> Milan Zamazal <mzamazal@redhat.com> (reviewer:vhost-user-scmi)
>>> "Michael S. Tsirkin" <mst@redhat.com> (supporter:vhost)
>>> Stefano Garzarella <sgarzare@redhat.com> (reviewer:vhost)
>>> qemu-devel@nongnu.org (open list:All patches CC here)
>>>
>>> Pls drop this patch.
>>>
>>>> ---
>>>>    MAINTAINERS | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index aa2df9cbe3..4d558ddee9 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -2622,7 +2622,7 @@ F: include/hw/virtio/vhost-user-snd.h
>>>>    vhost-user-scmi
>>
>> So what we want is to add here:
>>
>>    M: Michael S. Tsirkin <mst@redhat.com>
>>    R: Stefano Garzarella <sgarzare@redhat.com>
> 
> But these files already get M from the match against hw/virtio/ -
> what am I missing?

Yeah, just trying to make Markus script happy ;)

> 
>>>>    R: Milan Zamazal <mzamazal@redhat.com>
>>>> -S: Supported
>>>> +S: Orphan
>>>>    F: hw/virtio/vhost-user-scmi*
>>>>    F: include/hw/virtio/vhost-user-scmi.h
>>>>    F: tests/qtest/libqos/virtio-scmi.*
>>>> -- 
>>>> 2.54.0
>>>
>>>
> 
> 


