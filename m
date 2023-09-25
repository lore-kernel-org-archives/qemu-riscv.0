Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F055ACE7A8C
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:26:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qknSx-0008Rc-FQ; Mon, 25 Sep 2023 11:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qknSv-0008Pe-9U
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 11:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qknSt-0007vi-3j
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 11:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695655538;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J37O+3RdexR2S+GEkypPqePHvQti2/yHLtDs+8yRB8w=;
 b=ZkLSmPvV5YYkRILsV/S8Zb4j04x/YBTGCfZ1N10V9okA06gvqEcePelH9dvT0osJWfCDDi
 fSEkKZnevQjJUR+XVTHS2BwNsgbFl1w119fRa4c8EZyVUZZ3Gvc+tem+e2DCw/uaRbb/HU
 /1d6DdJrkZvQPaZfmFsL6pW50ELK0Js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-6nlRrxR1PbqhFavxA_2EJA-1; Mon, 25 Sep 2023 11:25:33 -0400
X-MC-Unique: 6nlRrxR1PbqhFavxA_2EJA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C655F18175A1;
 Mon, 25 Sep 2023 15:25:31 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B17F749BB9A;
 Mon, 25 Sep 2023 15:25:25 +0000 (UTC)
Date: Mon, 25 Sep 2023 16:25:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 02/31] tests/lcitool: add swtpm to the package list
Message-ID: <ZRGmY4Uzy00ubc4f@redhat.com>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230925144854.1872513-3-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Sep 25, 2023 at 03:48:25PM +0100, Alex Bennée wrote:
> We need this to test some TPM stuff.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/cirrus/macos-12.vars                    | 2 +-
>  tests/docker/dockerfiles/alpine.docker               | 1 +
>  tests/docker/dockerfiles/centos8.docker              | 1 +
>  tests/docker/dockerfiles/debian-amd64-cross.docker   | 1 +
>  tests/docker/dockerfiles/debian-amd64.docker         | 1 +
>  tests/docker/dockerfiles/debian-arm64-cross.docker   | 1 +
>  tests/docker/dockerfiles/debian-armhf-cross.docker   | 1 +
>  tests/docker/dockerfiles/debian-ppc64el-cross.docker | 1 +
>  tests/docker/dockerfiles/debian-s390x-cross.docker   | 1 +
>  tests/docker/dockerfiles/fedora-win32-cross.docker   | 1 +
>  tests/docker/dockerfiles/fedora-win64-cross.docker   | 1 +
>  tests/docker/dockerfiles/fedora.docker               | 1 +
>  tests/docker/dockerfiles/opensuse-leap.docker        | 1 +
>  tests/docker/dockerfiles/ubuntu2204.docker           | 1 +
>  tests/lcitool/libvirt-ci                             | 2 +-
>  tests/lcitool/projects/qemu.yml                      | 1 +
>  16 files changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


