Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067B2EE7FF4
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 08:54:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfcgI-0000f9-Ng; Mon, 11 Sep 2023 04:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1qfcgH-0000eO-Cu
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 04:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1qfcgF-0003Sc-BK
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 04:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694422442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=inenpGtvZGm4ERVSxm5rkFMlmrMjxB3w5pOrlPXM+VA=;
 b=AO65eB23Ko07sVTWPZ73p+QZqctPNT0gVV5AkOauuhtjQ7ts0HJ8abk6W1IqEoRLfgDs8F
 VOky7gOinOx8h089PgFo6urGJDR0fkzZwrXC2g07km9o+JjNXgWU1zjZYRiWci6cIoE16A
 7bmwuJOvEf7w48z4si5on3s/2j/mmiQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-mW1pCbzuPXuhEPj9Ly5BbQ-1; Mon, 11 Sep 2023 04:53:58 -0400
X-MC-Unique: mW1pCbzuPXuhEPj9Ly5BbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A0AB856DED;
 Mon, 11 Sep 2023 08:53:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 687381006B75;
 Mon, 11 Sep 2023 08:53:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3055D1800850; Mon, 11 Sep 2023 10:53:55 +0200 (CEST)
Date: Mon, 11 Sep 2023 10:53:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu devel list <qemu-devel@nongnu.org>, 
 "Richard W.M. Jones" <rjones@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, "Warkentin,
 Andrei" <andrei.warkentin@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: Re: riscv64 virt board crash upon startup
Message-ID: <qubprrerylzpvdl56o7j2zetkjihpofetfwequhanvc54l4t6q@juqqrcko4zjk>
References: <139b9697-5732-dafa-0942-6d93eed674c7@redhat.com>
 <1398e971-8115-13e1-6ee4-4c46df0814dc@linaro.org>
 <fe0ebb81-30b7-9e60-e9b5-7737c562274b@redhat.com>
 <CAMxuvawd9Zzq8tpqBNv4ft8R1QvYOvQaVmSB_ZeBgr+O5=M=9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxuvawd9Zzq8tpqBNv4ft8R1QvYOvQaVmSB_ZeBgr+O5=M=9Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Sep 11, 2023 at 12:12:43PM +0400, Marc-André Lureau wrote:
> > Gerd, here's the question for you: why are "device" and "head" QOM properties in the first place? What are they needed for?
> >
> 
> You get QOM tree introspection (ex: (qemu) qom-get
> /backend/console[0]/device type). Other than that, I don't think it
> brings anything else.

You can configure vnc server(s) to show a specific device + head, which
allows to run multihead configurations by using multiple vnc servers (one
for each head).

You can link input devices to device + head, so input events can go to
different devices depending on where they are coming from.  Which is
most useful for tablet devices in a vnc multihead setup, each head has
its own tablet device then.  Requires manual guest-side configuration
to establish the same tablet <-> head relationship (tested that years
ago with X11, not sure if and how this can be done with wayland).

HTH,
  Gerd


