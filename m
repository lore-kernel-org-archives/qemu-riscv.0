Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EC1CA0ECA
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 08:41:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfyxJ-0007Hz-V7; Tue, 12 Sep 2023 04:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1qfyxI-0007Hg-7t
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 04:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1qfyxF-0005ES-0y
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 04:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694508063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfEOcZknbojrrgPAVBeZLT3dw7kOHlGw1NkSu2dhAfs=;
 b=gurOpTnSfO3vkCMj9APcBsRRgzWzPPJ+HGaZ1P1HUqUQYt7/+tdeIwbMrqTpslydVqALp9
 PM5MO4kCam8hBlj+J24Ue1y6/O82IxFGCXO//Fiv5VxAZ+n8NCTGGYqvllSr+c2ZKORIEg
 MS+58TUiupTVRbds6R3Rp7ziE6wTMjU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-ieVmBDC_MuuUNQroOHu-1A-1; Tue, 12 Sep 2023 04:41:00 -0400
X-MC-Unique: ieVmBDC_MuuUNQroOHu-1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33C03181A6E0;
 Tue, 12 Sep 2023 08:41:00 +0000 (UTC)
Received: from [10.39.193.227] (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7638864687;
 Tue, 12 Sep 2023 08:40:57 +0000 (UTC)
Message-ID: <a780ae61-a086-8f1e-e9d7-7be1cf2c0590@redhat.com>
Date: Tue, 12 Sep 2023 10:40:56 +0200
MIME-Version: 1.0
Subject: Re: riscv64 virt board crash upon startup
Content-Language: en-US
From: Laszlo Ersek <lersek@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu devel list <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, "Warkentin, Andrei" <andrei.warkentin@intel.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <139b9697-5732-dafa-0942-6d93eed674c7@redhat.com>
 <1398e971-8115-13e1-6ee4-4c46df0814dc@linaro.org>
 <fe0ebb81-30b7-9e60-e9b5-7737c562274b@redhat.com>
 <CAMxuvawd9Zzq8tpqBNv4ft8R1QvYOvQaVmSB_ZeBgr+O5=M=9Q@mail.gmail.com>
 <qubprrerylzpvdl56o7j2zetkjihpofetfwequhanvc54l4t6q@juqqrcko4zjk>
 <1d5713bd-5be3-d1c2-8d71-f0f59e8f1bca@redhat.com>
In-Reply-To: <1d5713bd-5be3-d1c2-8d71-f0f59e8f1bca@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/11/23 15:12, Laszlo Ersek wrote:
> On 9/11/23 10:53, Gerd Hoffmann wrote:
>> On Mon, Sep 11, 2023 at 12:12:43PM +0400, Marc-André Lureau wrote:
>>>> Gerd, here's the question for you: why are "device" and "head" QOM properties in the first place? What are they needed for?
>>>>
>>>
>>> You get QOM tree introspection (ex: (qemu) qom-get
>>> /backend/console[0]/device type). Other than that, I don't think it
>>> brings anything else.
>>
>> You can configure vnc server(s) to show a specific device + head, which
>> allows to run multihead configurations by using multiple vnc servers (one
>> for each head).
>>
>> You can link input devices to device + head, so input events can go to
>> different devices depending on where they are coming from.  Which is
>> most useful for tablet devices in a vnc multihead setup, each head has
>> its own tablet device then.  Requires manual guest-side configuration
>> to establish the same tablet <-> head relationship (tested that years
>> ago with X11, not sure if and how this can be done with wayland).
> 
> OK, so I'm going to drop patch#3.

Hmmm, wait, I originally asked about the "QOM trickery" for a different
reason.

There are two things:

- using (exposing) QOM properties for introspection,

- using those propreties for internal access.

Patch#3 would eliminate property use *internally*, it would not
interfere with the use case explained by Gerd.

I originally asked about QOM because I wanted to know where to *stop
removing* QOM stuff. Like, once I replaced the QOM accessors with normal
C struct / field accesses in qemu_console_is_multihead(), why would I
stop there, and not just remove the "head" and and "device" properties
altogether?

With Gerd's explanation, I understand we need to keep those properties
-- but that doesn't seem to imply we *must* use the properties even in
internal functions such as qemu_console_is_multihead(). There, we can
just go for direct field access; is that right? (IOW I'd still keep
patch#3, if I can!)

Thanks!
Laszlo


