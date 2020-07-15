Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvibq-0005xQ-A0
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jul 2020 10:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvibp-0005x3-EY
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2020 10:42:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55900
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvibn-0006z8-Mx
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2020 10:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594824126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kfqOhXnPnf+UyFn8mp8BmKwKeI7wjv8FW71ouctYZ4=;
 b=Xt3a1SjZnIzNCYd/6I1J5Uj+pq5CY7lj/1lXd62xxsogS0sJ/6u0ApnciVjrM6TCeUbAMo
 5LvF+S7NMah+vsKo1MnCQwyU67MUWWF4hgw92H/WCe5BOz2rLst5PuvKUVSq2ehN6PJmHm
 GBQTeZ+PRXZz1lGiIQ1ZthaOI4C5oIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-Gx7VUQYKNBSbSnJxRP6ccA-1; Wed, 15 Jul 2020 10:42:00 -0400
X-MC-Unique: Gx7VUQYKNBSbSnJxRP6ccA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7905819200C0;
 Wed, 15 Jul 2020 14:41:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4277219C4F;
 Wed, 15 Jul 2020 14:41:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BE12D11386A6; Wed, 15 Jul 2020 16:41:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, thuth@redhat.com,
 qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, alistair@alistair23.me,
 mark.cave-ayland@ilande.co.uk, sundeep.lkml@gmail.com, b.galvani@gmail.com,
 nieklinnenbank@gmail.com, qemu-arm@nongnu.org, palmer@dabbelt.com
Subject: Re: [PATCH for-5.1 1/2] msf2: Unbreak device-list-properties for
 "msf-soc"
References: <20200715140440.3540942-1-armbru@redhat.com>
 <20200715140440.3540942-2-armbru@redhat.com>
 <ef1d7fe4-0558-cc7b-16d7-906c4aa9915b@amsat.org>
Date: Wed, 15 Jul 2020 16:41:56 +0200
In-Reply-To: <ef1d7fe4-0558-cc7b-16d7-906c4aa9915b@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 15 Jul 2020 16:15:51
 +0200")
Message-ID: <87wo34u9fv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:37:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Jul 2020 14:42:09 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 7/15/20 4:04 PM, Markus Armbruster wrote:
>> Watch this:
>>=20
>>     $ qemu-system-aarch64 -M ast2600-evb -S -display none -qmp stdio
>>     {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 5}, =
"package": "v5.0.0-2464-g3a9163af4e"}, "capabilities": ["oob"]}}
>>     {"execute": "qmp_capabilities"}
>>     {"return": {}}
>>     {"execute": "device-list-properties", "arguments": {"typename": "msf=
2-soc"}}
>>     Unsupported NIC model: ftgmac100
>>     armbru@dusky:~/work/images$ echo $?
>>     1
>>=20
>> This is what breaks "make check SPEED=3Dslow".
>>=20
>> Root cause is m2sxxx_soc_initfn()'s messing with nd_table[] via
>> qemu_check_nic_model().  That's wrong.
>>=20
>> We fixed the exact same bug for device "allwinner-a10" in commit
>> 8aabc5437b "hw/arm/allwinner-a10: Do not use nd_table in instance_init
>> function".  Fix this instance the same way: move the offending code to
>> m2sxxx_soc_realize(), where it's less wrong, and add a FIXME comment.
>
> That addresses this other thread, right?
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720658.html

Correct!  I wasn't aware of it, thanks for making the connection.


