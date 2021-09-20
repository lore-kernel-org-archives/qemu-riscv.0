Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mSE6G-0002l1-Nr
	for mharc-qemu-riscv@gnu.org; Mon, 20 Sep 2021 03:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSE6F-0002hQ-0y
 for qemu-riscv@nongnu.org; Mon, 20 Sep 2021 03:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSE6B-00065D-CP
 for qemu-riscv@nongnu.org; Mon, 20 Sep 2021 03:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632124342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSCRk3gf1wtfcS3/OBghIUENWewKVNi0wJCfGtm3PbQ=;
 b=OB+OZuweR/vYjsQ6zVGv4MHuNV22idnhgjJXwmWqh28OFVfpCUnri7+O8G4/puaunSMQss
 PrH6gMroSikw+gp0HUB7Y47FldUhPoDQRFKE8R+Rj+oS7+sbt4EUQiJ0PIt7Gkcdvy7vkd
 X+yRxl4Eb0V0O6JlKMKeHu+/e/6YSRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-is1nIFgGNuSDoF3LPDuXJg-1; Mon, 20 Sep 2021 03:52:21 -0400
X-MC-Unique: is1nIFgGNuSDoF3LPDuXJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67A681084685;
 Mon, 20 Sep 2021 07:52:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05F9719E7E;
 Mon, 20 Sep 2021 07:51:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 90B48113865F; Mon, 20 Sep 2021 09:51:57 +0200 (CEST)
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
Subject: Re: [PATCH v2 04/53] docs/devel: add example of command returning
 unstructured text
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-5-berrange@redhat.com>
Date: Mon, 20 Sep 2021 09:51:57 +0200
In-Reply-To: <20210914142042.1655100-5-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 14 Sep 2021 15:19:53
 +0100")
Message-ID: <87v92v3crm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Mon, 20 Sep 2021 07:52:27 -0000

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This illustrates how to add a QMP command returning unstructured text,
> following the guidelines added in the previous patch. The example uses
> a simplified version of 'info roms'.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/writing-monitor-commands.rst | 85 +++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing=
-monitor-commands.rst
> index d68c552fdd..4cf51ab557 100644
> --- a/docs/devel/writing-monitor-commands.rst
> +++ b/docs/devel/writing-monitor-commands.rst
> @@ -647,3 +647,88 @@ has to traverse the list, it's shown below for refer=
ence::
   Modelling data in QAPI
   ~~~~~~~~~~~~~~~~~~~~~~

   For a QMP command that to be considered stable and supported long term,
   there is a requirement returned data should be explicitly modelled
   using fine-grained QAPI types. As a general guide, a caller of the QMP
   command should never need to parse individual returned data fields. If
   a field appears to need parsing, then it should be split into separate
   fields corresponding to each distinct data item. This should be the
   common case for any new QMP command that is intended to be used by
   machines, as opposed to exclusively human operators.

   Some QMP commands, however, are only intended as ad hoc debugging aids
   for human operators. While they may return large amounts of formatted
   data, it is not expected that machines will need to parse the result.
   The overhead of defining a fine grained QAPI type for the data may not
   be justified by the potential benefit. In such cases, it is permitted
   to have a command return a simple string that contains formatted data,
   however, it is mandatory for the command to use the 'x-' name prefix.
   This indicates that the command is not guaranteed to be long term
   stable / liable to change in future and is not following QAPI design
   best practices. An example where this approach is taken is the QMP
   command "x-query-registers". This returns a formatted dump of the
   architecture specific CPU state. The way the data is formatted varies
   across QEMU targets, is liable to change over time, and is only
   intended to be consumed as an opaque string by machines.

Recommend to add a forward reference to section "Writing a debugging aid
..." here.

[...]
> =20
>       qapi_free_TimerAlarmMethodList(method_list);
>   }
> +
> +Writing a debugging aid returning unstructured text
> +---------------------------------------------------
> +
> +As discussed at the start of the previous example, it is required that

Suggest 'As discussed in section "Modelling data in QAPI"'.

> +commands expecting machine usage be using fine-grained QAPI data types.
> +The exception to this rule applies when the command is solely intended
> +as a debugging aid and allows for returning unstructured text. This is
> +commonly needed for query commands that report aspects of QEMU's
> +internal state that are useful to human operators.
> +
> +In this example we will consider a simplified variant of the HMP
> +command ``info roms``. Following the earlier rules, this command will
> +need to live under the ``x-`` name prefix, so its QMP implementation
> +will be called ``x-query-roms``. It will have no parameters and will
> +return a single text string::
> +
> + { 'struct': 'HumanReadableText',
> +   'data': { 'human-readable-text': 'str' } }
> +
> + { 'command': 'x-query-roms',
> +   'returns': 'HumanReadableText' }
> +
> +The ``HumanReadableText`` struct is intended to be used for all
> +commands, under the ``x-`` name prefix that are returning unstructured
> +text targetted at humans. It should never be used for commands outside
> +the ``x-`` name prefix, as those should be using structured QAPI types.
> +
> +Implementing the QMP command
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The QMP implementation will typically involve creating a ``GString``
> +object and printing formatted data into it::
> +
> + HumanReadableText *qmp_x_query_roms(Error **errp)
> + {
> +     GString buf =3D g_string_new("");
> +     HumanReadableText ret =3D g_new0(HumanReadableText, 1);
> +     Rom *rom;
> +
> +     QTAILQ_FOREACH(rom, &roms, next) {
> +        g_string_append_printf("%s size=3D0x%06zx name=3D\"%s\"\n",
> +                               memory_region_name(rom->mr),
> +                               rom->romsize,
> +                               rom->name);
> +     }
> +
> +     ret->human_readable_text =3D g_string_free(buf, FALSE);
> +
> +     return ret;
> + }
> +
> +
> +Implementing the HMP command
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Now that the QMP command is in place, we can also make it available in
> +the human monitor (HMP) as shown in previous examples. The HMP
> +implementations will all look fairly similar, as all they need do is
> +invoke the QMP command and then print the resulting text or error
> +message. Here's the implementation of the "info roms" HMP command::
> +
> + void hmp_info_roms(Monitor *mon, const QDict *qdict)
> + {
> +     Error err =3D NULL;
> +     g_autoptr(HumanReadableText) info =3D qmp_x_query_roms(&err);

Humor me: blank line between declarations and statements, please.

> +     if (err) {
> +         error_report_err(err);
> +         return;
> +     }
> +     monitor_printf(mon, "%s\n", info->human_readable_text);
> + }
> +
> +Also, you have to add the function's prototype to the hmp.h file.
> +
> +There's one last step to actually make the command available to
> +monitor users, we should add it to the hmp-commands-info.hx file::
> +
> +    {
> +        .name       =3D "roms",
> +        .args_type  =3D "",
> +        .params     =3D "",
> +        .help       =3D "show roms",
> +        .cmd        =3D hmp_info_roms,
> +    },


