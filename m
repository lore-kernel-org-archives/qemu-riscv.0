Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mva3V-0000Qi-HB
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:10:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mva3T-0000Pr-Me
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:10:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mva3O-0000AV-Hv
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639120249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NrKUpAEE3We2TDSaDHulcP+8iYO7ZZGoN3t5/iPC/EY=;
 b=NkQI8eLehVjHED8yoNbobAKzUCnyZE+o//RLcYXjGn+y/4kimaUFjGWnb90ux2cIUuJxad
 gB4i2pZMCXGMtMMFOQaghRqbkJn5x1cpLHu5meb7cUEH5zdMJNk77TilwXmO17hnsSYwqG
 orMBTqLytp3IxL93c2kI7KsD1+gT6iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-yURZGEHCP-S0SayW6_OO_A-1; Fri, 10 Dec 2021 02:10:46 -0500
X-MC-Unique: yURZGEHCP-S0SayW6_OO_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A39B10151E3;
 Fri, 10 Dec 2021 07:10:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C14119C59;
 Fri, 10 Dec 2021 07:10:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 899C7113865F; Fri, 10 Dec 2021 08:10:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Bin Meng <bin.meng@windriver.com>,  Alistair
 Francis <alistair.francis@wdc.com>,  alistair23@gmail.com,
 bmeng.cn@gmail.com
Subject: Re: [PATCH 7/7] hw/riscv: Use error_fatal for SoC realisation
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
 <20211208064252.375360-8-alistair.francis@opensource.wdc.com>
Date: Fri, 10 Dec 2021 08:10:42 +0100
In-Reply-To: <20211208064252.375360-8-alistair.francis@opensource.wdc.com>
 (Alistair Francis's message of "Wed, 8 Dec 2021 16:42:52 +1000")
Message-ID: <87v8zxc4ul.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 07:10:55 -0000

Alistair Francis <alistair.francis@opensource.wdc.com> writes:

> From: Alistair Francis <alistair.francis@wdc.com>
>
> When realising the SoC use error_fatal instead of error_abort as the
> process can fail and report useful information to the user.
>
> Currently a user can see this:
>
>    $ ../qemu/bld/qemu-system-riscv64 -M sifive_u -S -monitor stdio -display none -drive if=pflash
>     QEMU 6.1.93 monitor - type 'help' for more information
>     (qemu) Unexpected error in sifive_u_otp_realize() at ../hw/misc/sifive_u_otp.c:229:
>     qemu-system-riscv64: OTP drive size < 16K
>     Aborted (core dumped)
>
> Which this patch addresses
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reported-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


