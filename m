Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHhHc-0006jr-1P
	for mharc-qemu-riscv@gnu.org; Thu, 04 Mar 2021 01:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHhHb-0006j9-Bd
 for qemu-riscv@nongnu.org; Thu, 04 Mar 2021 01:16:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHhHU-000204-Po
 for qemu-riscv@nongnu.org; Thu, 04 Mar 2021 01:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614838557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+c2QbpBZhD/X5mAE4tIw2s+mvf1Xr2Z7syEFQgdlVK8=;
 b=D+WBl7uees6QsQa6+uHizDMvQ11x7tsU4vLdeJnNWzKsqUFKINk39JJS0HQLRoLATVzNLs
 RkYmL8zSiF9d8Zs/CuxE51jFoZDIFWKowBMdAClP34ZfmsrCuqNzvtB/6f+FDj9jEj/G8d
 7K6g3nnBJmUctuFLTwWMD6cIt/IWyM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-EzAsdx2aMJasx3nGrADMdQ-1; Thu, 04 Mar 2021 01:15:54 -0500
X-MC-Unique: EzAsdx2aMJasx3nGrADMdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EABF580196E;
 Thu,  4 Mar 2021 06:15:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 628361F434;
 Thu,  4 Mar 2021 06:15:33 +0000 (UTC)
Subject: Re: [RFC PATCH 6/7] cpu: Move CPUClass::has_work() to TCGCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210302102737.1031287-1-f4bug@amsat.org>
 <20210302102737.1031287-7-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dfda927b-8937-afe2-f853-5c9817499c4a@redhat.com>
Date: Thu, 4 Mar 2021 07:15:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302102737.1031287-7-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 04 Mar 2021 06:16:23 -0000

On 02/03/2021 11.27, Philippe Mathieu-Daudé wrote:
> We can only check if a vCPU has work with TCG.
> Restrict the has_work() handler to TCG by moving it to
> the TCGCPUOps structure, and adapt all the targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC: PPC target incomplete
> ---
[...]
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 00330ba07de..3110867c3a3 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -261,11 +261,6 @@ static void cpu_common_reset(DeviceState *dev)
>       }
>   }
>   
> -static bool cpu_common_has_work(CPUState *cs)
> -{
> -    return false;
> -}
> -
>   ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
>   {
>       CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
> @@ -397,7 +392,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
>   
>       k->parse_features = cpu_common_parse_features;
>       k->get_arch_id = cpu_common_get_arch_id;
> -    k->has_work = cpu_common_has_work;
>       k->get_paging_enabled = cpu_common_get_paging_enabled;
>       k->get_memory_mapping = cpu_common_get_memory_mapping;
>       k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;

cpu_common_has_work() is gone without replacement? Can you be sure that the 
pointer in tcg_ops is always initialized? If so, could you please add a 
comment to the patch description?

  Thomas


