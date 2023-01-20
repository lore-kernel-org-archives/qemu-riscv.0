Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIlib-0008Vl-5t
	for mharc-qemu-riscv@gnu.org; Fri, 20 Jan 2023 02:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIliE-0008KR-UQ
 for qemu-riscv@nongnu.org; Fri, 20 Jan 2023 02:21:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIli9-00012k-Bj
 for qemu-riscv@nongnu.org; Fri, 20 Jan 2023 02:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674199276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U8fqrK2B0xXuYyb/vNRlhuAA3jAFICSFgWC4yjr9VfY=;
 b=PqQjKIvMROmai9QsDtXl9nCzWNpda7P/JOdd1OGDPknvgFJxxtB8VEjFx6Knu8TluN5b/W
 dlMqbxmeZMVYmjz6OQRVWmzabfrE6XM0fXlYaIwbjDW47dPnXQyNx6dZ5BHEKFcYQJdaea
 ATecbt/wBfeycEuY2PJBkByBypz/Ng8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-UDsUsJOdN5-PhKKdsBEYUw-1; Fri, 20 Jan 2023 02:21:10 -0500
X-MC-Unique: UDsUsJOdN5-PhKKdsBEYUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 097B2185A78B;
 Fri, 20 Jan 2023 07:21:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BA982166B2A;
 Fri, 20 Jan 2023 07:21:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 612D021E6A28; Fri, 20 Jan 2023 08:21:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,  "kwolf@redhat.com"
 <kwolf@redhat.com>,  "hreitz@redhat.com" <hreitz@redhat.com>,
 "imp@bsdimp.com" <imp@bsdimp.com>,  "kevans@freebsd.org"
 <kevans@freebsd.org>,  "berrange@redhat.com" <berrange@redhat.com>,
 "groug@kaod.org" <groug@kaod.org>,  "qemu_oss@crudebyte.com"
 <qemu_oss@crudebyte.com>,  "mst@redhat.com" <mst@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>,  "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>,  "alistair@alistair23.me"
 <alistair@alistair23.me>,  "jasowang@redhat.com" <jasowang@redhat.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "quintela@redhat.com" <quintela@redhat.com>,  "dgilbert@redhat.com"
 <dgilbert@redhat.com>,  "michael.roth@amd.com" <michael.roth@amd.com>,
 "kkostiuk@redhat.com" <kkostiuk@redhat.com>,  "palmer@dabbelt.com"
 <palmer@dabbelt.com>,  "bin.meng@windriver.com" <bin.meng@windriver.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,  "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>,  "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Alessandro Di Federico <ale@rev.ng>
Subject: Re: [PATCH v4 12/19] target/hexagon: Clean up includes
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-13-armbru@redhat.com>
 <SN4PR0201MB88082EB8B56772833BE60374DEC49@SN4PR0201MB8808.namprd02.prod.outlook.com>
Date: Fri, 20 Jan 2023 08:21:08 +0100
In-Reply-To: <SN4PR0201MB88082EB8B56772833BE60374DEC49@SN4PR0201MB8808.namprd02.prod.outlook.com>
 (Taylor Simpson's message of "Thu, 19 Jan 2023 22:15:37 +0000")
Message-ID: <87sfg5oemz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Fri, 20 Jan 2023 07:21:40 -0000

Taylor Simpson <tsimpson@quicinc.com> writes:

>> -----Original Message-----
>> From: Markus Armbruster <armbru@redhat.com>
>> Sent: Thursday, January 19, 2023 1:00 AM
>> To: qemu-devel@nongnu.org
>> Cc: richard.henderson@linaro.org; pbonzini@redhat.com;
>> kwolf@redhat.com; hreitz@redhat.com; imp@bsdimp.com;
>> kevans@freebsd.org; berrange@redhat.com; groug@kaod.org;
>> qemu_oss@crudebyte.com; mst@redhat.com; philmd@linaro.org;
>> peter.maydell@linaro.org; alistair@alistair23.me; jasowang@redhat.com;
>> jonathan.cameron@huawei.com; kbastian@mail.uni-paderborn.de;
>> quintela@redhat.com; dgilbert@redhat.com; michael.roth@amd.com;
>> kkostiuk@redhat.com; Taylor Simpson <tsimpson@quicinc.com>;
>> palmer@dabbelt.com; bin.meng@windriver.com; qemu-block@nongnu.org;
>> qemu-arm@nongnu.org; qemu-riscv@nongnu.org
>> Subject: [PATCH v4 12/19] target/hexagon: Clean up includes
>> 
>> Clean up includes so that osdep.h is included first and headers which it
>> implies are not included manually.
>> 
>> This commit was created with scripts/clean-includes.
>> 
>> Changes to standalone programs dropped, because I can't tell whether them
>> not using qemu/osdep.h is intentional:
>> 
>>     target/hexagon/gen_dectree_import.c
>>     target/hexagon/gen_semantics.c
>>     target/hexagon/idef-parser/idef-parser.h
>>     target/hexagon/idef-parser/parser-helpers.c
>>     target/hexagon/idef-parser/parser-helpers.h
>
> Correct.  These are standalone programs not built with the full QEMU context.

I'll tweak the commit message like this:

   Changes to standalone programs dropped, because these intentionally
   don't use qemu/osdep.h:

>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  target/hexagon/hex_arch_types.h | 1 -
>>  target/hexagon/mmvec/macros.h   | 1 -
>>  2 files changed, 2 deletions(-)
>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

Thanks!


