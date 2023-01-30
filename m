Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMTha-0000iz-3j
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 07:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMThX-0000iA-KN
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 07:56:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMThW-0000is-2p
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 07:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675083357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X1MvUoO4rGgk5ZUx7XU1kZj53hjbVCR8EAsQuTx6Gqg=;
 b=PEgVWkGS4FM3q7UnMdAgDPF7qC3cmQWRRCehx7YyGnWFOwyPm4GaAFKQEA1Wwvs7Vvx3hx
 KEvKu90Nuae1FZ1Is8zKJcTcR4L+fuRLldb8FhhPzF/6lhoeeoGnr3+Qo0Dh8qqTmPAEy/
 vCDXpBkd6UGQGKcBcFYf2vlwGRJYe4M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-hydz8xuxPwaj3e_cwe3reA-1; Mon, 30 Jan 2023 07:55:51 -0500
X-MC-Unique: hydz8xuxPwaj3e_cwe3reA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C3582A59576;
 Mon, 30 Jan 2023 12:55:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B7922166B26;
 Mon, 30 Jan 2023 12:55:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 467DE21E6A1F; Mon, 30 Jan 2023 13:55:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  philmd@linaro.org,
 peter.maydell@linaro.org,  alistair@alistair23.me,  jasowang@redhat.com,
 jonathan.cameron@huawei.com,  kbastian@mail.uni-paderborn.de,
 quintela@redhat.com,  dgilbert@redhat.com,  michael.roth@amd.com,
 kkostiuk@redhat.com,  tsimpson@quicinc.com,  palmer@dabbelt.com,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 01/19] scripts/clean-includes: Fully skip / ignore files
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-2-armbru@redhat.com>
 <20230128052749-mutt-send-email-mst@kernel.org>
Date: Mon, 30 Jan 2023 13:55:48 +0100
In-Reply-To: <20230128052749-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Sat, 28 Jan 2023 05:28:26 -0500")
Message-ID: <87r0vcb2qz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 30 Jan 2023 12:56:00 -0000

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Jan 19, 2023 at 07:59:41AM +0100, Markus Armbruster wrote:
>> When clean-includes claims to skip or ignore a file, only the part
>> that sanitizes use of qemu/osdep.h skips the file.  The part that
>> looks for duplicate #include does not, and neither does committing to
>> Git.
>> 
>> The latter can get unrelated stuff included in the commit, but only if
>> you run clean-includes in a dirty tree, which is unwise.  Messed up
>> when we added skipping in commit fd3e39a40c "scripts/clean-includes:
>> Enhance to handle header files".
>> 
>> The former can cause bogus reports for --check-dup-head.  Added in
>> commit d66253e46a "scripts/clean-includes: added duplicate #include
>> check", duplicating the prior mistake.
>> 
>> Fix the script to fully skip files.
>> 
>> Fixes: fd3e39a40ca2ee26b09a5de3149af8b056b85233
>> Fixes: d66253e46ae2b9c36a9dd90b2b74c0dfa5804b22
>
> Isn't
> Fixes: %h (\"%s\")
>
> the accepted format for this?

It seems to be common these days.  I'll adjust.


