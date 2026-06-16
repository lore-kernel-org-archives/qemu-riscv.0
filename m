Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EF0CD98DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 06:08:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZMxn-0001DR-0f; Tue, 16 Jun 2026 02:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wZMxl-0001D1-Nf
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 02:07:53 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wZMxi-00051y-GM
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 02:07:53 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-662bf1dab83so81403d50.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 23:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781590069; cv=none;
 d=google.com; s=arc-20240605;
 b=RUQUqmKMwYXRyxn8zOyucybzqgeKqEdqOGmuFBy1njBCmGgfwpR5sgCe+Nq7DDcAri
 OD8hQXDYj9E/KzxWEhFZokm63UbX5nKa3CvSi4rtSedYw5+mIY8a0tLd51d5vWsXtHG/
 3Vn+a6suxyrhLNcXca5aniHdicmR+4sMNqxk17QN2/+vv1du/RMTxVmAnS9BnMQuCSZh
 gmazRYrXuGiX3KmJcrvs+8i+H11lSsC8J22kb50vwvrXEfauI450kHE8grQKItUEPSSE
 Z/BX/eAAZgCc6IlcpHO4M99fiSuebJBcp8koj/Kfk4lHHBw8JkJzuH3L/U7d911RT4xO
 8BcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pESiwWNxb94mhHRYt1CBhVbbqP8rXPyrE6ZNlFz/Kjc=;
 fh=bSoaA/0ngtLRxv4gyN/4aAiEncne6U1kRJp6iMSoyfU=;
 b=cl/vh65MekdxLSrQ5GPQrn7q4K3uXaZnOC1Yv7/CT2FQwdLOXsQq17mAoHHNDL2Aev
 YmWNqXxndl695Ea0s4j1yND0/egGO9Hoga07CoxuiKDGcXdXROFrX8LaNy2vgZ745Yf/
 3W7EpmQ27PhIqtxl5oW2BLHFNa34F0URVyFvze7mYs9kUHhQ3HwbHVD3Ct/O7aF/ZqHH
 mxf/tDVjqfjQOdgHBIPfUWs8zrXngBMScKWLHEXIAN/CcMZ84ofq/aCxzLgu+cLlCZXw
 oI47pUj6iwQZk7Pj8uuc7djtGU5MD2JW3koCzb1a5CvP+P6uKlWYf8Jc1aB3WetdVImk
 XVyw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1781590069; x=1782194869; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pESiwWNxb94mhHRYt1CBhVbbqP8rXPyrE6ZNlFz/Kjc=;
 b=I1tN1F5YxYB5MFBmzn4DhN0+92aA9JPjvhHOHxjhgVe/8dfnOkAqebTTfy8sW3CliG
 wmh6UTe9gfUVNZMbepmMaMJ5rMZVvfVYSCgrmjFnBOvMsICkaaqZLI0R9mJSfoB8XS5e
 9WfFHxgCB1Necc79bFr9I2itRtTw437ugYP1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781590069; x=1782194869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pESiwWNxb94mhHRYt1CBhVbbqP8rXPyrE6ZNlFz/Kjc=;
 b=pAa+h0NyAYPpi5o8bughV4HorvuemW71WQJc9lXxF4bjK0veMWNnFaRWwSgpdGyzFO
 ypG8kDQUgxQmge/IalQlYo5j0Ylr3HP271oEMjNn6qqpSrhAM/dk9Hmm6Pj37JR/Cj/W
 sTS4Z1ysb98vrhM4u+Vsz4l7yujej0Gaqes1l/YeNHSKbEK4P/V3mVlRoT/+RrXAf6Cn
 opeQSezbSfXgACJYPy8qpr837amH5hvRecsUKKjFoIF8sJSHLEM3qNsNnZZxVwx16/lU
 wbVymgHLJg7JUA2jS+qXcCbvcwfjfaR126QT+fBy93C36DNx0X/hM3U/6Zf85FRSrarQ
 uQpA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+5Wbq3WHvlLjbRi/rvWhDYziY8VkG6xhVKhphfdT+pvr7eO+F+JMB0LVkYaApg22aLhb410rZGUCH9@nongnu.org
X-Gm-Message-State: AOJu0YxreH6OhRd2tfv7PDnDsWclm1UPDOZnoifQqVXs44eU4fIuichz
 +tzMhuCfgcukd1Xjl4ZHoKoicZgd+xuUXoOm2a52ipsqByZZtzR8eY+27YVfn9sWsrY7fGhHdYL
 NMzkqRDIFSM+FseKxMPcL3eM65+BlSRo=
X-Gm-Gg: Acq92OGzC8RlfdtQ0oSLMLbMewQpXlKchF98Ytk47ZaoPrbTqMt2JIQVGasNiBfh2/R
 AtXBSXgGDQDg0bVcg4CRWHn+qVpsBa+4hmz/rKFco/cmNe4dganD8XmyG0v+wPAxgt0EZjvQVaF
 yCtjaQLC6SnrTlQ6XPJdGTirbmn0ACr3pm06H6aalHk3IUiAW+3Zvgybtio/Wlr4JwmjR3Qd/Ai
 GCzKNq8NllgstUM/q2RNoy5sGelliGOcXK5bZXA8l3m3CH+gOEiO/Wvv7oHYR4bT8reatgNRxy9
 MdOefsxlTk7rPEVRHu0ZYfUytlc7fMVDLwegiS0TbOsOR636HfH2AVaSUp6ckuZl8uH1Z9UOw6U
 AbfvalOwwd0RIOIwjrWxFpB6m
X-Received: by 2002:a53:d018:0:b0:660:4799:47e9 with SMTP id
 956f58d0204a3-66285111d61mr12313359d50.48.1781590068862; Mon, 15 Jun 2026
 23:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
In-Reply-To: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jun 2026 15:37:37 +0930
X-Gm-Features: AVVi8CeJ4Aljj9MV_QrfiLGNs1cxBm9yYKso789Vr3Om98COqFZLzbYHdpymLSc
Message-ID: <CACPK8Xe9JVggXzX9kku-zm7RYzM++fqcr=fx-MdkKiViHdiMYw@mail.gmail.com>
Subject: Re: Regular QEMU RISC-V Call
To: Alistair <alistair@alistair23.me>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 qemu-riscv@nongnu.org, max.chou@sifive.com, mikey@neuling.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 11 Jun 2026 at 13:52, Alistair <alistair@alistair23.me> wrote:
> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.

I'll be on, hopefully in the right timezone this time around. 9:30 ACST.

> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.

Two agenda items:

* RISC-V Code Policy

https://lore.kernel.org/qemu-riscv/057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me/

Good idea writing down your expectations somewhere everyone can see.
Do you want to raise it as a topic and we can talk it through?

* Machine model use cases

I wanted to share my perspective on the system emulator machines, what
they are for, who they are for, and hear what others had to say.

See you on the call tomorrow.

Cheers,

Joel

