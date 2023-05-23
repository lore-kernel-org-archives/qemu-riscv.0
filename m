Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D756AC7EE29
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 09:51:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1Ofl-0007dQ-QM; Tue, 23 May 2023 05:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1q1Ofl-0007cb-42
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 05:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1q1Ofj-000309-3g
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 05:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684835473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3xOroy4ze+GF66ZLm1zN/I3YIhvALvXuuoKMP8gH9g=;
 b=TzrRLVuVbhXj1nNIGkZlqthBGTSj5nwHENdVK0t511J0mMPTRIza3BjIHxYSnCuLcK3DbH
 md+FlJUE0/yUZEkGy/Xe6ozr5z6g4IUCinJozo9xVJ73sH5SvBHCoQmKjE+sl9Yyvxm06e
 bLD+GLniYzcW3HYN5rOtrZW2ycKmCzs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-AEd0cnk5OuiINb-q3dAuhA-1; Tue, 23 May 2023 05:51:10 -0400
X-MC-Unique: AEd0cnk5OuiINb-q3dAuhA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D88F1C0A58D;
 Tue, 23 May 2023 09:51:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03610492B00;
 Tue, 23 May 2023 09:51:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, rkanwal@rivosinc.com, anup@brainfault.org,
 dbarboza@ventanamicro.com, atishp@atishpatra.org, vincent.chen@sifive.com,
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, Avihai Horon
 <avihaih@nvidia.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org
Subject: Re: [PTACH v2 1/6] update-linux-headers: sync-up header with Linux
 for KVM AIA support
In-Reply-To: <CAMWQL2gDRcawsLLVUpL5dV1nXGKBqWiE_6SSgOw8+ZgLjgO8rw@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230505113946.23433-1-yongxuan.wang@sifive.com>
 <20230505113946.23433-2-yongxuan.wang@sifive.com>
 <20230505101707.495251a2.alex.williamson@redhat.com>
 <878rdze0fx.fsf@redhat.com>
 <CAMWQL2gDRcawsLLVUpL5dV1nXGKBqWiE_6SSgOw8+ZgLjgO8rw@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 23 May 2023 11:51:07 +0200
Message-ID: <87o7mb5qb8.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, May 23 2023, Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:

> On Mon, May 8, 2023 at 3:39=E2=80=AFPM Cornelia Huck <cohuck@redhat.com> =
wrote:
>>
>> On Fri, May 05 2023, Alex Williamson <alex.williamson@redhat.com> wrote:
>>
>> > On Fri,  5 May 2023 11:39:36 +0000
>> > Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
>> >
>> >> Update the linux headers to get the latest KVM RISC-V headers with AI=
A support
>> >> by the scripts/update-linux-headers.sh.
>> >> The linux headers is comes from the riscv_aia_v1 branch available at
>> >> https://github.com/avpatel/linux.git. It hasn't merged into the mainl=
ine kernel.
>> >
>> > Updating linux-headers outside of code accepted to mainline gets a down
>> > vote from me.  This sets a poor precedent and can potentially lead to
>> > complicated compatibility issues.  Thanks,
>> >
>> > Alex
>>
>> Indeed, this needs to be clearly marked as a placeholder patch, and
>> replaced with a proper header sync after the changes hit the mainline
>> kernel.
>>
>
> Hi Alex and Cornelia,
>
> We found that the changes are from 2 different patchsets.
>
> [1] https://lore.kernel.org/lkml/20230404153452.2405681-1-apatel@ventanam=
icro.com/
> [2] https://www.spinics.net/lists/kernel/msg4791872.html
>
> Patchset 1 is already merged into mainline kernel in v6.4-rc1 and
> patchset 2 is not.
> Maybe we can split them into two placeholder patches?

Please just keep this as a single placeholder patch; once you rebase on
top of a tree that includes a proper rebase to 6.4-rcX, the placeholder
patch will simply shrink to the bits in patchset 2. The important part
is that nobody tries to merge it by accident.


