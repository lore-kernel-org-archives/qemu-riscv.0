Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6BDCD8CA8
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 03:46:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXsr8-0000gN-Ar; Thu, 11 Jun 2026 23:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wXsr6-0000gC-Ko
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 23:46:52 -0400
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wXsr4-0006hR-Lb
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 23:46:52 -0400
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 69318EC009F;
 Thu, 11 Jun 2026 23:46:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 11 Jun 2026 23:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm1;
 t=1781236009; x=1781322409; bh=HEqlBnYTkDW/LI7YowjBMHTHP0HA/ClY
 OTUYs8yyr/o=; b=nMrOkvUN5BR3wIOZ91lTIagxCLQpSKh5+AEQnk8GCRDQKvaj
 n7pkOwWt27cy4MAXxh416JoGrJcatCcxdKIPT3diiNbz2taQWRi/NcKtwD0H9ze2
 6gxKXkBCwjSMCeoxuLqnL2jIo/cA3U6rYdgJWL99RcpjRGdsFLq/0dizih0tZ+OG
 M1dGYVmrpGQKcmjyzdTtr355ihmdvv0QZ9UykuUhLjkFRoSXJhVT2VePYzH56fEW
 mZ+0V71nmltCtqHT5JtBEQ2dwfKTrlKAlKizxxYNeXB0Why2rFKnqQf65qFW/AbV
 XO6HsEpG2FJ3hMoAyWRu0r6OxMPghsT/8XLM/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781236009; x=
 1781322409; bh=HEqlBnYTkDW/LI7YowjBMHTHP0HA/ClYOTUYs8yyr/o=; b=V
 bZqZQu41u8b/NBmWtI2eEvnakL00dPVahLtUZZVj925N17JWofcUrig/u2logCys
 EMPUCssHB2UN4yTZIKCjQ7hSVaHFsUBddhrWC/zDQawepMxk+cNQf1/fmSzAFrY4
 0fIIGZsU4kCclculMSng5t5edNfM9LtdPOOcNLW4H+zDl5goyM/yZSu0+FI0z+S3
 FhofLMvyTqwkit4ShPaGDbPihRbUhGeMbOSWft3HbZ4aIJwKRMb4GJFLjHesW8s6
 4nieHXCcz1mXqCscC6nn84rplVu9KrjwT+MNr4J4YEN7EM2fkweYOHDnOTWSUfcI
 WV3TSkAOceuU1fEUO8t9g==
X-ME-Sender: <xms:KYEratFKZ8eKkWDWw-5ljlIl2iqZUW3qDNQuvZnXGaTVqKD6PR3obA>
 <xme:KYErasW-x1_6-koKInPOormmqJcanSRRZXrfZ765ZjwIBoyQhR7jNJgBwcwy6PYa-
 TBQzS1Vv0eF4zLynOaZRNZLeOwYt4I4BSe-5-Dg_XNclLul-A6qmdXX>
X-ME-Received: <xmr:KYEralzGSxlKoYwZ0mWKi349rX60KZBq4UooZNZXBvItautSUK_o5SQtn4N8WNT4uw>
X-ME-Proxy-Cause: dmFkZTFV6zeuoqtYn4VoV+A5gbkj0SWZccP19Cc1eAMUceQKHZ1Z+963/DLPpMAZcWCUCj
 HTNuOqrZGJQwTJiG9LWqgvH7pmhVFZkvqVCvXwdhSrVIFWiWY3LC9hKq8JKMOrGKmzxvkT
 Un1Y76/n92SgQWo1K/LbgQzxN82I2UY1IAi+fJOnPWSH0escjpdUud1L3SHVpxmr20tGQX
 47xGKoO2ya0g3TSrT8sdlBdWHe0TyiWhMIE7VbU7daglxPRQXc92IaWz00DTUBgC8XAnb5
 f8zJJ34aBrBbUfd3sjn0dtxqTzbU0aF8ToiGBYJC51OGCtxz5IDK6tndz990Wqmmfu9lTE
 C2QmN86/2B62qW465HgDsMteZ2oQ8Yf9fCBLXopp78/TUDgT2A/3WCtvYA1M1AfYGgdszl
 phP3veqwojxyWSXtTtry0O/Y6MB/6wHdJRrWYSmAXh82jqJ5rJ1kxlYWV5Ur7Yn6NdutRW
 yjqCeW3HmnlK/Bz7Kjgllw4JJtTfqtnzZMZxLVXHvbGhJ25qzQ6rCu24hFwVlPzt8Q5Rga
 XJkVF49B0PrenQxGzx3H6kbI2gsWfFxSq64sACU8gxMrfoI9U2ayMT7mxVblNAm+npe4Pt
 lAbzppPnfaOeKAIjZyTbkELjYi0ZxX3pwnnldKL9D3wc2qNOJ8aJmZk8Ci/A
X-ME-Proxy: <xmx:KYErahQbAl84XmpH7DGWb0RWuSMD3E4pVGABiKzbD6uQbYMQB2FHYQ>
 <xmx:KYErahjQbCn2SGoQUUtlrACNgyTNnG-_Kk-Zu1BujRzscVzoqx2-nQ>
 <xmx:KYEraokKHj8W01TimW_RHu1VF44HKcOeN0zBH71NqdetWCCmlrJ1rg>
 <xmx:KYEraktnq-iCGpu_yhbW7mauQ0F4vHwQKPvum-T5h9szedw_oTJoJQ>
 <xmx:KYErapKFeBdKSUELe5AtDy8ZUVlBl9WKL9YDBfM4go7ZX1LNeliu04gr>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 23:46:45 -0400 (EDT)
Message-ID: <c5e243ee-2da1-4b82-8248-d69d7525227a@alistair23.me>
Date: Fri, 12 Jun 2026 13:46:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regular QEMU RISC-V Call
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, qemu-riscv@nongnu.org, max.chou@sifive.com,
 mikey@neuling.org
References: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
 <CANs6eM=nBQO-dpY6ib0qdfihJUPcYmM3xAhkqV6_6d_jsX5K9Q@mail.gmail.com>
Content-Language: en-AU
From: Alistair Francis <alistair@alistair23.me>
In-Reply-To: <CANs6eM=nBQO-dpY6ib0qdfihJUPcYmM3xAhkqV6_6d_jsX5K9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 12/6/26 03:53, Palmer Dabbelt wrote:
> On Wed, Jun 10, 2026 at 9:23 PM Alistair <alistair@alistair23.me> wrote:
>>
>> Hello everyone,
>>
>> As we discussed last time we should setup a reoccurring meeting for QEMU RISC-V. The current plan is to start next week and then occur once every month.
>>
>> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.
> 
> IIUC that's Tuesday 5pm Pacific.  I'm pretty terrible with time zones,
> so I just made a calendar event and it should be accessible here:
> https://calendar.google.com/calendar/u/0?cid=Y183NGQxMTNlNjRmZGYyMmU5OGQyMjkwZjMxYzY2MzRiMWY2OTg2YWJlOWVmNDRiYmM2MjQ2YWU3ZTI5NTliYmMxQGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20
> 

Yeah, that looks right to me.

Alistair

>>
>> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.
>>
>> Alistair
>>


