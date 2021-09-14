Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQAvU-000363-JR
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 12:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mQAvT-00030Q-2V
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 12:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mQAvQ-0004tt-HA
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 12:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631635487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZIYJkjqZj/D1h8kkOFmcGoJBonyy55Av2r41rRnnUM=;
 b=IHao28xqPvfF4/KBdkFsXtEtqAxn/obSSQNJwbSHEolEVuEM50VJbYT/sDrRpXuCo4UoCt
 vqMZMpr/2XdGj+UTsCH6S5BZAXoFUIIM5saJLr9MvHEM5R2GryarpXY7qfnKvwcCo+172o
 Lk1STrnS3M62rs7EiPVhTg12wAIS304=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-IvGu5wM9NtWqiNzgXOz3Ng-1; Tue, 14 Sep 2021 12:04:40 -0400
X-MC-Unique: IvGu5wM9NtWqiNzgXOz3Ng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ED6C1007312;
 Tue, 14 Sep 2021 16:04:22 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54B4F60CC9;
 Tue, 14 Sep 2021 16:04:18 +0000 (UTC)
Date: Tue, 14 Sep 2021 11:04:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Xu <peterx@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Halil Pasic <pasic@linux.ibm.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>
Subject: Re: [PATCH v2 29/53] qapi: introduce x-query-registers QMP command
Message-ID: <20210914160416.tmk5nuhch2yhfb27@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-30-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-30-berrange@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Sep 2021 16:04:51 -0000

On Tue, Sep 14, 2021 at 03:20:18PM +0100, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info registers" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> ad hoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---

> +++ b/qapi/common.json
> @@ -197,3 +197,14 @@
>  { 'enum': 'GrabToggleKeys',
>    'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllock',
>              'ctrl-scrolllock' ] }
> +
> +##
> +# @HumanReadableText:
> +#
> +# @human-readable-text: Formatted output intended for humans.
> +#
> +# Since: 6.2.0

Should be '6.2', not '6.2.0', to match...

> +#
> +##
> +{ 'struct': 'HumanReadableText',
> +  'data': { 'human-readable-text': 'str' } }
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 157712f006..8737efa865 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1312,3 +1312,18 @@
>       '*cores': 'int',
>       '*threads': 'int',
>       '*maxcpus': 'int' } }
> +
> +##
> +# @x-query-registers:
> +#
> +# @cpu: the CPU number to query. If omitted, queries all CPUs
> +#
> +# Query information on the CPU registers
> +#
> +# Returns: CPU state in an architecture-specific format
> +#
> +# Since: 6.2

...the prevailing style.

If it were likely that someone might backport just some (but not all)
added x- commands, it may be wise to separate the creation of
HumanReadableText into its own patch to backport that but not
x-query-registers.  But I rather suspect anyone backporting this will
take the series wholesale, so the coupling in this patch is not worth
worrying about.

> +##
> +{ 'command': 'x-query-registers',
> +  'data': {'*cpu': 'int' },
> +  'returns': 'HumanReadableText' }
> -- 
> 2.31.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


