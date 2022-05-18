Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nrJFQ-00033o-IR
	for mharc-qemu-riscv@gnu.org; Wed, 18 May 2022 08:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrJFK-0002ti-UH
 for qemu-riscv@nongnu.org; Wed, 18 May 2022 08:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrJFI-0004sN-IO
 for qemu-riscv@nongnu.org; Wed, 18 May 2022 08:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652878663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r/iWT7CDvmmD4iCK2Ha+DpB0e/sEI/E5l04AHhRzZyI=;
 b=aARlmBd3lZ6fjQjTwPHfJZyy6ykIdDOmPPyN3vVvxzc7D1uE4WgYxqoilE/t+SbLajCN+M
 dog+tiX/mkNuvF6E9vTPK2dWiHgdvt4Johh+Q9fSN3UT21ftubfBbVrztf1jHRdsWwsLpk
 cgIPtyCu6RoCnPQnTt+zpas8UWSSsPs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215--6ulXlTAPpaKeRhMNS3dbA-1; Wed, 18 May 2022 08:57:40 -0400
X-MC-Unique: -6ulXlTAPpaKeRhMNS3dbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAF80294EDC0;
 Wed, 18 May 2022 12:57:38 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B695B2026D6A;
 Wed, 18 May 2022 12:57:30 +0000 (UTC)
Date: Wed, 18 May 2022 07:57:29 -0500
From: Eric Blake <eblake@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, qemu-riscv@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, "Denis V. Lunev" <den@openvz.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 01/18] block: Make blk_{pread,pwrite}() return 0 on success
Message-ID: <20220518125729.jya2p4rdw2b4qrvs@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113524.197910-2-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517113524.197910-2-afaria@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 18 May 2022 12:57:50 -0000

On Tue, May 17, 2022 at 12:35:07PM +0100, Alberto Faria wrote:
> They currently return the value of their 'bytes' parameter on success.
> 
> Make them return 0 instead, for consistency with other I/O functions and
> in preparation to implement them using generated_co_wrapper. This also
> makes it clear that short reads/writes are not possible.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---

> +++ b/qemu-img.c
> @@ -5120,30 +5120,27 @@ static int img_dd(int argc, char **argv)
>      in.buf = g_new(uint8_t, in.bsz);
>  
>      for (out_pos = 0; in_pos < size; block_count++) {

in_pos, out_pos, and size are int64_t...

> -        int in_ret, out_ret;
> +        int bytes, in_ret, out_ret;
>  
> -        if (in_pos + in.bsz > size) {
> -            in_ret = blk_pread(blk1, in_pos, in.buf, size - in_pos);
> -        } else {
> -            in_ret = blk_pread(blk1, in_pos, in.buf, in.bsz);
> -        }
> +        bytes = (in_pos + in.bsz > size) ? size - in_pos : in.bsz;

...but in.bsz is int, so declaring 'int bytes' appears safe.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


