Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nrKJc-00084a-Ej
	for mharc-qemu-riscv@gnu.org; Wed, 18 May 2022 10:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrKJb-00081H-9q
 for qemu-riscv@nongnu.org; Wed, 18 May 2022 10:06:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrKJZ-0000Rl-KC
 for qemu-riscv@nongnu.org; Wed, 18 May 2022 10:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652882772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gSIEdEmHfbdNucrQ/8h+a6IwiBRevPkI7nVmjkHcjNI=;
 b=WsXAyF/538OZZGJRClw6qt9t+R6qj6ocdfwu1N8uQ6vDaxXb1jntoTSbqFHei7POmQbgGv
 0km7XT43efTiPzXclZnyI9EOAcj1MLvmG6dBPi3pWyKT9jCtGDcf/sxXUP2f59852mfuJj
 AnrF0e/kbZfZvMaE8tHNCpcVWVjZMhw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-E4H1s_CMMkqFwnmpns0-6Q-1; Wed, 18 May 2022 10:06:09 -0400
X-MC-Unique: E4H1s_CMMkqFwnmpns0-6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3409F811E76;
 Wed, 18 May 2022 14:06:08 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 420A22026D6A;
 Wed, 18 May 2022 14:05:41 +0000 (UTC)
Date: Wed, 18 May 2022 09:05:39 -0500
From: Eric Blake <eblake@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Andrew Jeffery <andrew@aj.id.au>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Jeff Cody <codyprime@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Juan Quintela <quintela@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH 03/18] block: Change blk_{pread,pwrite}() param order
Message-ID: <20220518140539.pxs36ea3zshorlf4@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113746.198993-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517113746.198993-1-afaria@redhat.com>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 18 May 2022 14:06:15 -0000

On Tue, May 17, 2022 at 12:37:31PM +0100, Alberto Faria wrote:
> Swap 'buf' and 'bytes' around for consistency with
> blk_co_{pread,pwrite}(), and in preparation to implement these functions
> using generated_co_wrapper.
> 
> Callers were updated using this Coccinelle script:
> 
>     @@ expression blk, offset, buf, bytes, flags; @@
>     - blk_pread(blk, offset, buf, bytes, flags)
>     + blk_pread(blk, offset, bytes, buf, flags)
> 
>     @@ expression blk, offset, buf, bytes, flags; @@
>     - blk_pwrite(blk, offset, buf, bytes, flags)
>     + blk_pwrite(blk, offset, bytes, buf, flags)
> 
> It had no effect on hw/block/nand.c, presumably due to the #if, so that
> file was updated manually.
> 
> Overly-long lines were then fixed by hand.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


