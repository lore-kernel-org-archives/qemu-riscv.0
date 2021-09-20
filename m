Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mSDxb-0006wN-0m
	for mharc-qemu-riscv@gnu.org; Mon, 20 Sep 2021 03:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSDxX-0006sF-60
 for qemu-riscv@nongnu.org; Mon, 20 Sep 2021 03:43:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSDxS-0006qC-9i
 for qemu-riscv@nongnu.org; Mon, 20 Sep 2021 03:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632123800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJrFIQreAuEyTIbd27/BJkBa0A4tQQVTICtjiXNdj94=;
 b=avXK1mm1QL9fHeMQqooyCOfOQIuPJZ5xEjMwFaukpjCLzGPyfnEuVm2YCGoW/OzjCss4zz
 Axc1CU3gl9fe4hSt7Og9LDLhxIGFbSCFLvF35jG0Pabr7soyRqSJ4OkOtNOazT3Y0AxMby
 igGOmt4dcB+hwjDg4ahHNLTpec9LgYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-LnEYpc1rPUGw5UxtqaEKwg-1; Mon, 20 Sep 2021 03:43:19 -0400
X-MC-Unique: LnEYpc1rPUGw5UxtqaEKwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F7F8362FB;
 Mon, 20 Sep 2021 07:43:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9DDE1F436;
 Mon, 20 Sep 2021 07:42:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 94A1F113865F; Mon, 20 Sep 2021 09:42:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Greg Kurz <groug@kaod.org>,  Bin Meng
 <bin.meng@windriver.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 Stafford Horne <shorne@gmail.com>,  Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,  Peter
 Xu <peterx@redhat.com>,  Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-ppc@nongnu.org,  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,  qemu-arm@nongnu.org,  Michael
 Rolnik <mrolnik@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,  Alistair Francis
 <alistair.francis@wdc.com>,  Halil Pasic <pasic@linux.ibm.com>,  Taylor
 Simpson <tsimpson@quicinc.com>,  Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org,  Max Filippov <jcmvbkbc@gmail.com>,  Yuval Shaia
 <yuval.shaia.ml@gmail.com>,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  Artyom Tarasenko <atar4qemu@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Thomas Huth
 <thuth@redhat.com>,  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Gibson <david@gibson.dropbear.id.au>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Laurent Vivier <laurent@vivier.eu>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Eduardo Habkost
 <ehabkost@redhat.com>,  Marek Vasut <marex@denx.de>,  Aurelien Jarno
 <aurelien@aurel32.net>,  qemu-s390x@nongnu.org,  Laurent Vivier
 <lvivier@redhat.com>,  Eric Blake <eblake@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Chris Wulff <crwulff@gmail.com>
Subject: Re: [PATCH v2 02/53] docs/devel: tweak headings in monitor command
 docs
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-3-berrange@redhat.com>
Date: Mon, 20 Sep 2021 09:42:36 +0200
In-Reply-To: <20210914142042.1655100-3-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 14 Sep 2021 15:19:51
 +0100")
Message-ID: <875yuv4rrn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.476, DKIM_SIGNED=0.1,
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
X-List-Received-Date: Mon, 20 Sep 2021 07:43:28 -0000

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The new headings reflect the intended structure of the document and will
> better suit additions that follow.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/writing-monitor-commands.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing=
-monitor-commands.rst
> index 497c9ce0d5..cddb36fb74 100644
> --- a/docs/devel/writing-monitor-commands.rst
> +++ b/docs/devel/writing-monitor-commands.rst
> @@ -85,8 +85,8 @@ any data". Now you're ready to enter the QMP example co=
mmands as explained in
>  the following sections.
> =20
> =20
> -Writing a command that doesn't return data
> -------------------------------------------
> +Writing a simple command: hello-world
> +-------------------------------------
> =20
>  That's the most simple QMP command that can be written. Usually, this ki=
nd of
>  command carries some meaningful action in QEMU but here it will just pri=
nt
> @@ -340,8 +340,8 @@ Please, check the "-monitor" command-line option to k=
now how to open a user
>  monitor.
> =20
> =20
> -Writing a command that returns data
> ------------------------------------
> +Writing more complex commands
> +-----------------------------
> =20
>  A QMP command is capable of returning any data the QAPI supports like in=
tegers,
>  strings, booleans, enumerations and user defined types.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


