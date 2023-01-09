Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEqqS-0005Zu-1I
	for mharc-qemu-riscv@gnu.org; Mon, 09 Jan 2023 07:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pEqqR-0005Zg-0X
 for qemu-riscv@nongnu.org; Mon, 09 Jan 2023 07:01:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pEqqP-0001nT-3h
 for qemu-riscv@nongnu.org; Mon, 09 Jan 2023 07:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673265696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TclbkyhSX21Sa2KCTCzGt6PcChwfW7SrUYi93nNWHac=;
 b=VFX3oE1SVhK9Ensqi85YmgFlEZURWub+aJkCH/Dd6J1w3AczINGbYEfRgnZO8BrAwVSl0O
 9gZLf+WdqHhr5K86ycgwprAE99xi9YzMST4WvVghh0h3b5L+KFFpX/A6gp5PWMnwysD6iR
 Chs6sc2kT6pg9PRpG8YOz1leSg/XjcA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-qs0PPn3tPlS0juzuVCqIkg-1; Mon, 09 Jan 2023 07:01:32 -0500
X-MC-Unique: qs0PPn3tPlS0juzuVCqIkg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E6411869B72;
 Mon,  9 Jan 2023 12:01:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7CE492B01;
 Mon,  9 Jan 2023 12:01:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79D7021E5DCF; Mon,  9 Jan 2023 13:01:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,  mst@redhat.com,  imammedo@redhat.com,
 ani@anisinha.ca,  peter.maydell@linaro.org,  laurent@vivier.eu,
 edgar.iglesias@gmail.com,  Alistair.Francis@wdc.com,
 bin.meng@windriver.com,  palmer@dabbelt.com,  marcel.apfelbaum@gmail.com,
 yangxiaojuan@loongson.cn,  gaosong@loongson.cn,
 richard.henderson@linaro.org,  deller@gmx.de,  jasowang@redhat.com,
 vikram.garhwal@amd.com,  francisco.iglesias@amd.com,  clg@kaod.org,
 kraxel@redhat.com,  marcandre.lureau@redhat.com,  riku.voipio@iki.fi,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,  qemu-ppc@nongnu.org,
 crwulff@gmail.com,  marex@denx.de
Subject: Re: [PATCH v2 4/4] docs/devel: Rules on #include in headers
References: <20221222120813.727830-1-armbru@redhat.com>
 <20221222120813.727830-5-armbru@redhat.com>
 <3400786A-51BD-43D6-A6E4-4EE0A91D1C4E@gmail.com>
Date: Mon, 09 Jan 2023 13:01:27 +0100
In-Reply-To: <3400786A-51BD-43D6-A6E4-4EE0A91D1C4E@gmail.com> (Bernhard
 Beschow's message of "Fri, 23 Dec 2022 10:47:39 +0000")
Message-ID: <87ilhfq5m0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 09 Jan 2023 12:01:39 -0000

Bernhard Beschow <shentey@gmail.com> writes:

> Am 22. Dezember 2022 12:08:13 UTC schrieb Markus Armbruster <armbru@redhat.com>:
>>Rules for headers were proposed a long time ago, and generally liked:
>>
>>    Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>>    https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
>>
>>Wortk them into docs/devel/style.rst.
>>
>>Suggested-by: Bernhard Beschow <shentey@gmail.com>
>>Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>---
>> docs/devel/style.rst | 7 +++++++
>> 1 file changed, 7 insertions(+)
>>
>>diff --git a/docs/devel/style.rst b/docs/devel/style.rst
>>index 7ddd42b6c2..68aa776930 100644
>>--- a/docs/devel/style.rst
>>+++ b/docs/devel/style.rst
>>@@ -293,6 +293,13 @@ that QEMU depends on.
>> Do not include "qemu/osdep.h" from header files since the .c file will have
>> already included it.
>> 
>>+Headers should normally include everything they need beyond osdep.h.
>>+If exceptions are needed for some reason, they must be documented in
>>+the header.  If all that's needed from a header is typedefs, consider
>>+putting those into qemu/typedefs.h instead of including the header.
>>+
>>+Cyclic inclusion is forbidden.
>>+
>
> Nice!
>
> I wonder if these should be bullet points like in your mail from 2016. I found them crystal clear since they looked like a todo list for review.

I tried to blend my change in with the existing text.

> Feel free to respin. Either way:
>
> Reviewed-by: Bernhard Beschow <shentey@gmail.com>

Thanks!


