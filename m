Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A6EC4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 15:45:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOJiP-0005Co-B1; Fri, 12 Jan 2024 10:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1rOJiN-0005BY-Ph
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 10:44:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1rOJiK-0005xi-97
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 10:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705074294;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hfrdnEtpGn94s5HzyRrjF4o/Q8dg/DO4WQ288cW8ZFY=;
 b=IIS0v6rxG8BF4yx+wUvflCmoTmm5PfIVql+BgJmIggbd5XUgZwfuzm3ekEFsAX5X66zopR
 E3jhfiBC9K2WI43eVIAeGoF6VEg25xMGup3qsgPrFyeKhIbjsdBar/KgZydHWj78THxjmd
 /0M5K4KNMkWoHESJqV6UqUrbDBYiDtU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-315-qHMIU1caNEeRbQSiFqv-Ag-1; Fri,
 12 Jan 2024 10:44:52 -0500
X-MC-Unique: qHMIU1caNEeRbQSiFqv-Ag-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05F6E3C29A67;
 Fri, 12 Jan 2024 15:44:48 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 246D2492BC6;
 Fri, 12 Jan 2024 15:44:40 +0000 (UTC)
Date: Fri, 12 Jan 2024 15:44:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 12/43] qtest: bump boot-serial-test timeout to 3 minutes
Message-ID: <ZaFeZXP-3sYdnZbS@redhat.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-13-alex.bennee@linaro.org>
 <cf617223-0a0b-4d42-84a3-cd323ea4c421@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf617223-0a0b-4d42-84a3-cd323ea4c421@redhat.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.09,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jan 12, 2024 at 04:13:16PM +0100, Thomas Huth wrote:
> On 03/01/2024 18.33, Alex Bennée wrote:
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > The boot-serial-test takes about 1 + 1/2 minutes in a --enable-debug
> > build. Bumping to 3 minutes will give more headroom.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Message-ID: <20230717182859.707658-9-berrange@redhat.com>
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > Message-Id: <20231215070357.10888-9-thuth@redhat.com>
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > ---
> >   tests/qtest/meson.build | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index c7944e8dbe9..dc1e6da5c7b 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -6,6 +6,7 @@ slow_qtests = {
> >     'test-hmp' : 240,
> >     'pxe-test': 600,
> >     'prom-env-test': 360,
> > +  'boot-serial-test': 180,
> >   }
> >   qtests_generic = [
> 
> 3 minutes was obviously not enough:
> 
>  https://gitlab.com/qemu-project/qemu/-/jobs/5918818492#L4984
> 
> And in older runs, we can see that the boot-serial-test might take longer
> than 180s when run with TCI :
> 
>  https://gitlab.com/qemu-project/qemu/-/jobs/5890481086#L4772
> 
> So I think we should bump the timeout to 240s here. Alex, are you going to
> respin your pull request? If so, could you modify your patch? Otherwise I
> can also send a new version of this patch here, just let me know.

Agreed, 240s seems a good next attempt

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


