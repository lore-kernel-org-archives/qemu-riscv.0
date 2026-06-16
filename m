Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FA0CD98CF
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 10:36:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZR9H-0007Di-QL; Tue, 16 Jun 2026 06:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wZR9H-0007DS-3x
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 06:36:03 -0400
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wZR9F-0002U9-FO
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 06:36:02 -0400
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 22895EC0259;
 Tue, 16 Jun 2026 06:35:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Tue, 16 Jun 2026 06:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm1;
 t=1781606159; x=1781692559; bh=HjXJlPEKjKoOHj27zUBQPL174SitTmyR
 kCwh1aH6rYM=; b=OxlbuuVu8ZuQYafIE1pmKKnavD61qteXPybezXwS412tR/fZ
 kT9dw7UOj+3UPmzSCuuRyxPWWpedSk+4XFPtnovLK0GGqgRxPsGEGGzHxTp9P3P+
 ovgPo5VoD+x8EeiwbWkDWpnVQbLf6mnAaz1dBntjt9FsGglPdmfyRbiHt3dCQlUc
 ln7BC4X8vmKyao6taPrlWfK4qVtwlId4H1PvHB7SeuqX1x7YsiDzDn5IHz74RsHP
 3OjHMA4jY4WfcPDWHXgzn+wi00CoX61L0WwvOJLdEw7gi0CAzcaqGd2TmQ41Uo/f
 Q/0Z3LVTts54AzOYdX1WKetFVl+dKFcVa1nGQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781606159; x=
 1781692559; bh=HjXJlPEKjKoOHj27zUBQPL174SitTmyRkCwh1aH6rYM=; b=I
 9Z4N+K+DZ9ah5aLQeorlqTX61AwuL1WAf59ErWoAGBOBML7hXEV0dswp+YQ20nMh
 URoQKSfP9T+Vvby+cQQNujBHw/wGEPd8cHogfNCbcP2W0AsEyK1+zFI1vdZqDV6/
 664kbpIycQYqdpVUrg37LC20DYZxKgC4Xgy+uPQKS6g5/7h/hTCSq0G8K11aQq0D
 yWbeZ4iDs9qHpOllRUXMV9c+RIrLPrt+e+pRnzxfjXEikwvq2Jbj/pEpllgXd3n9
 r6xALXtusvrOYlFBc9LkYk4vqszna7aBFPWTrlxTS13SbI2WGJ4NxsTxSOm5Kmeg
 eKY14vOuLug2V2D9410bQ==
X-ME-Sender: <xms:Dicxav6QYPxgOgJJgpc7damCqDvWnKao6KD77sVnYDXQGrwIMgda9Q>
 <xme:DicxalWmKzdBEb4XVhUFP2-ixVyD5PCF96M__hsWMeTIJp9VZms3OZZqGNyw90BgL
 elJ5llriGqOLEM2sWfv47RRf4soidk2uq-DpkMP4HNF-BJPu58ZbHtP>
X-ME-Received: <xmr:DicxanIsaYojK5LIGXDSVxGPa6Qm_b-url--wSdCDd17ELU59eY8t21R_Rx2_iT3pQ>
X-ME-Proxy-Cause: dmFkZTGhxQKQGqj7ns4Lvst7QIOGPCJhYbc5S1pvf43fVcoHeds97RB9S2qHeRKSuwZil3
 oiAwkx4E0QvkHFVyD0ZSCUEn2ETwe4fK/jkYJTyXIkMv9sbiUeAGUAOZMJlfzBDqLXs1Tr
 shK4xqR0M5Xy/3SYoBM1s4m6CNQgb5jL77rfbEqutP8x23TIT97noG0lSnlaqOWTSwljZe
 l4+2EAoHr0u51Zxx2ME4Ygga6wCZb1FQj0q2Ajr6k1lgDgFpWhkAA2KApl90cNtcVoObwo
 LSHn1VaJ/Tgf7ATzHSWiKSecsQx9uD/VGlEhACDByoOsiObcVyWT9M6lHfFankNE9sttto
 cHPH42Cxbw80ULKAwqXuX1O5l3jcEEry0Lx4L7y6lxgdg6TuVI+j3UF2oWlC6YHBAtbPE3
 eRBlkPDv2ecPnnYPtWC8GQk2i8naxcy/7Bcu6MkV89CVZTXH5q68eRrJGghsH7To2p4i4b
 1k/Pfz8O0GQTjZEOOpQWztyTYqXkgO9jur7a6LZ/QePSrPaySBZIkn1XSQ0pBlhmu3KXr0
 sYvqIb0YDv7gnoFU6OIHy8M0gCGYKgm/BuHSxgymzejzzzHW6OIPx1qaGwp2xgpG+r3MSh
 yOiCG/EaM0Q4OgIuP8PY8LR5RAfS6HEhVZ8Tb1ULoPUpDEkKZPwOnekGAY+w
X-ME-Proxy: <xmx:Dicxans_mrk4rTkGUEc7WDQeCaqrmvSRFNP-Q0DZgMq43BHgbHGyWg>
 <xmx:DicxakLCvz54TPXjJtiShKQ4FO7BM2fL5ZhwNDi13VUbxBXU6jpsfg>
 <xmx:DicxanMDeoGhhCsPPrUUwOkVEpmPnby9HXlY13ShEa8N5of7XM-zaA>
 <xmx:DicxavWhLgR6JEKQKhIUJJump6kWEc64R1V6NeC4Dl0LcbZ7zKJWtQ>
 <xmx:DycxasdjWRCUQg5udgjiGQyZsUOljCKBdoOas9qN_6_2BK3sgzubf2GO>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 06:35:53 -0400 (EDT)
Message-ID: <ad259828-65b3-4c4a-bf3f-73cc195c19f5@alistair23.me>
Date: Tue, 16 Jun 2026 20:35:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regular QEMU RISC-V Call
To: Joel Stanley <joel@jms.id.au>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 qemu-riscv@nongnu.org, max.chou@sifive.com, mikey@neuling.org
References: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
 <CACPK8Xe9JVggXzX9kku-zm7RYzM++fqcr=fx-MdkKiViHdiMYw@mail.gmail.com>
Content-Language: en-AU
From: Alistair Francis <alistair@alistair23.me>
In-Reply-To: <CACPK8Xe9JVggXzX9kku-zm7RYzM++fqcr=fx-MdkKiViHdiMYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.145;
 envelope-from=alistair@alistair23.me; helo=fout-a2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On 16/6/26 16:07, Joel Stanley wrote:
> On Thu, 11 Jun 2026 at 13:52, Alistair <alistair@alistair23.me> wrote:
>> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.

That means the meeting should start in a little less then 13 and a half 
hours! I'll send out a Teams invite tomorrow

> 
> I'll be on, hopefully in the right timezone this time around. 9:30 ACST.
> 
>> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.
> 
> Two agenda items:
> 
> * RISC-V Code Policy
> 
> https://lore.kernel.org/qemu-riscv/057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me/
> 
> Good idea writing down your expectations somewhere everyone can see.
> Do you want to raise it as a topic and we can talk it through?

Yep!

> 
> * Machine model use cases
> 
> I wanted to share my perspective on the system emulator machines, what
> they are for, who they are for, and hear what others had to say.

Sounds good as well

Alistair

> 
> See you on the call tomorrow.
> 
> Cheers,
> 
> Joel


