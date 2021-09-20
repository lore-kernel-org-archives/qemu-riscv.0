Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mSDyr-0000iA-A0
	for mharc-qemu-riscv@gnu.org; Mon, 20 Sep 2021 03:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSDyq-0000ef-1E
 for qemu-riscv@nongnu.org; Mon, 20 Sep 2021 03:44:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSDyn-0007yD-SH
 for qemu-riscv@nongnu.org; Mon, 20 Sep 2021 03:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632123885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Or9639w+kvOsVwXFchtwDibBSPMmqhe2Dh9xisQc+jQ=;
 b=Xhva3KiTIc2fzBS0OPMW4M5o+YC0sFHxu9fEJSf7YblUM5UA5MMx8hlAYjyPMrXJcJFWoG
 Q460hEMeG0nF+aWYsI5Li2OQng7+4fQUzFZbMfxgdKxKHtZbV7GywGszV+fUUhb0fmFs54
 0gTJUTeuw4b+hJemGF8Qxf9xshhWeOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-hJMhcfUCMuabuKvIGketiA-1; Mon, 20 Sep 2021 03:44:43 -0400
X-MC-Unique: hJMhcfUCMuabuKvIGketiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6088E824FAF;
 Mon, 20 Sep 2021 07:44:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1BC660C17;
 Mon, 20 Sep 2021 07:44:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9B515113865F; Mon, 20 Sep 2021 09:44:38 +0200 (CEST)
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
 <ehabkost@redhat.com>,  Marek Vasut <marex@denx.de>,  Markus Armbruster
 <armbru@redhat.com>,  Aurelien Jarno <aurelien@aurel32.net>,
 qemu-s390x@nongnu.org,  Laurent Vivier <lvivier@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>
Subject: Re: [PATCH v2 03/53] docs/devel: document expectations for QAPI
 data modelling for QMP
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-4-berrange@redhat.com>
Date: Mon, 20 Sep 2021 09:44:38 +0200
In-Reply-To: <20210914142042.1655100-4-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 14 Sep 2021 15:19:52
 +0100")
Message-ID: <871r5j4ro9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 20 Sep 2021 07:44:48 -0000

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Traditionally we have required that newly added QMP commands will model
> any returned data using fine grained QAPI types. This is good for
> commands that are intended to be consumed by machines, where clear data
> representation is very important. Commands that don't satisfy this have
> generally been added to HMP only.
>
> In effect the decision of whether to add a new command to QMP vs HMP has
> been used as a proxy for the decision of whether the cost of designing a
> fine grained QAPI type is justified by the potential benefits.
>
> As a result the commands present in QMP and HMP are non-overlapping
> sets, although HMP comamnds can be accessed indirectly via the QMP
> command 'human-monitor-command'.
>
> One of the downsides of 'human-monitor-command' is that the QEMU monitor
> APIs remain tied into various internal parts of the QEMU code. For
> example any exclusively HMP command will need to use 'monitor_printf'
> to get data out. It would be desirable to be able to fully isolate the
> monitor implementation from QEMU internals, however, this is only
> possible if all commands are exclusively based on QAPI with direct
> QMP exposure.
>
> The way to achieve this desired end goal is to finese the requirements
> for QMP command design. For cases where the output of a command is only
> intended for human consumption, it is reasonable to want to simplify
> the implementation by returning a plain string containing formatted
> data instead of designing a fine grained QAPI data type. This can be
> permitted if-and-only-if the command is exposed under the 'x-' name
> prefix. This indicates that the command data format is liable to
> future change and that it is not following QAPI design best practice.
>
> The poster child example for this would be the 'info registers' HMP
> command which returns printf formatted data representing CPU state.
> This information varies enourmously across target architectures and
> changes relatively frequently as new CPU features are implemented.
> It is there as debugging data for human operators, and any machine
> usage would treat it as an opaque blob. It is thus reasonable to
> expose this in QMP as 'x-query-registers' returning a 'str' field.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/writing-monitor-commands.rst | 27 +++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing=
-monitor-commands.rst
> index cddb36fb74..d68c552fdd 100644
> --- a/docs/devel/writing-monitor-commands.rst
> +++ b/docs/devel/writing-monitor-commands.rst
> @@ -350,6 +350,33 @@ In this section we will focus on user defined types.=
 Please, check the QAPI
>  documentation for information about the other types.
> =20
> =20
> +Modelling data in QAPI
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +For a QMP command that to be considered stable and supported long term,
> +there is a requirement returned data should be explicitly modelled
> +using fine-grained QAPI types. As a general guide, a caller of the QMP
> +command should never need to parse individual returned data fields. If
> +a field appears to need parsing, then it should be split into separate
> +fields corresponding to each distinct data item. This should be the
> +common case for any new QMP command that is intended to be used by
> +machines, as opposed to exclusively human operators.
> +
> +Some QMP commands, however, are only intended as ad hoc debugging aids
> +for human operators. While they may return large amounts of formatted
> +data, it is not expected that machines will need to parse the result.
> +The overhead of defining a fine grained QAPI type for the data may not
> +be justified by the potential benefit. In such cases, it is permitted
> +to have a command return a simple string that contains formatted data,
> +however, it is mandatory for the command to use the 'x-' name prefix.
> +This indicates that the command is not guaranteed to be long term
> +stable / liable to change in future and is not following QAPI design
> +best practices. An example where this approach is taken is the QMP
> +command "x-query-registers". This returns a formatted dump of the
> +architecture specific CPU state. The way the data is formatted varies
> +across QEMU targets, is liable to change over time, and is only
> +intended to be consumed as an opaque string by machines.
> +
>  User Defined Types
>  ~~~~~~~~~~~~~~~~~~

Reviewed-by: Markus Armbruster <armbru@redhat.com>


