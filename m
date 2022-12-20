Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p7eWi-0007Lh-BI
	for mharc-qemu-riscv@gnu.org; Tue, 20 Dec 2022 10:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vysakhpillai@embeddedinn.xyz>)
 id 1p7eWh-0007LG-0K; Tue, 20 Dec 2022 10:27:31 -0500
Received: from sender-of-o52.zoho.in ([103.117.158.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vysakhpillai@embeddedinn.xyz>)
 id 1p7eWd-0001yK-1q; Tue, 20 Dec 2022 10:27:30 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1671550028; cv=none; d=zohomail.in; s=zohoarc; 
 b=EdnWgCpqsmKi57ENZSfg9be9SlezBcu6oRwuWojfNeO2yl2PQrQpvnIJCQ7YS13YWe1jfv7YQ5iwGLtEoDrkehPr+URvtcuoK/G4xGjobkj8OdwWk39gm/2DzSkzJMU5+O+hjDzvD6RrsWrwM/TemnMney2ldzY035gazG8mBmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671550028;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=IoSREUnQFNwOzNDivpIcncV4ungnb6L2jFkd/nG+QYg=; 
 b=UermsN9OAey5Zfilt6w9mji8owFpoYBeQGMM7Tvo/I2KUlxXrRtOsqYU+87YMQqt5KfSAnLMmWQQnl17YBn95q/Am7e4IXKtn23rR8SVjIUG5A0po1bzry3N8nnvfTf4NiSx5+1jKKrGuRMgZRi39chKBiGQTOoVw2QbRlvvPIM=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=embeddedinn.xyz;
 spf=pass  smtp.mailfrom=vysakhpillai@embeddedinn.xyz;
 dmarc=pass header.from=<vysakhpillai@embeddedinn.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671550028; 
 s=zmail; d=embeddedinn.xyz; i=vysakhpillai@embeddedinn.xyz;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-Id:Message-Id:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Reply-To;
 bh=IoSREUnQFNwOzNDivpIcncV4ungnb6L2jFkd/nG+QYg=;
 b=DenE3NIIIEVk6DHUUiqun2divcnhyqb7bRl6/hKV+HWMFCPIEPLwYjosa38BLcZZ
 Sx6O15ptq+lmUXuZtDvDfk2M99uH9CPRu48gHm/oVbWgn5aVy5djxqpBxYgQZN+dUwG
 Hhgo31uvOapBk5af+xvIEfwabY9tTEstlZN2EXrE=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 167155002667639.50240115471149;
 Tue, 20 Dec 2022 20:57:06 +0530 (IST)
Date: Tue, 20 Dec 2022 07:27:06 -0800
From: Vysakh P Pillai <vysakhpillai@embeddedinn.xyz>
To: <bmeng.cn@gmail.com>
Cc: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Message-Id: <185302543b0.18ba608373080.7673654665642263784@embeddedinn.xyz>
In-Reply-To: <CAEUhbmU4dbAY0hiARrKLarQf6_A+DZ1McW=fQftMBfBpVy7VKw@mail.gmail.com>
References: <20221211052745.24738-1-vysakhpillai@embeddedinn.xyz>
 <CAEUhbmU4dbAY0hiARrKLarQf6_A+DZ1McW=fQftMBfBpVy7VKw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Add support to change default RISCV hart
 memory region
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_250202_247026888.1671550026672"
Importance: Normal
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Received-SPF: pass client-ip=103.117.158.52;
 envelope-from=vysakhpillai@embeddedinn.xyz; helo=sender-of-o52.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Dec 2022 15:27:31 -0000

------=_Part_250202_247026888.1671550026672
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In the machine model that I am trying to create, there are two CPU clusters=
. The management cluster has full access to the system resources through a =
global address space while the application cluster has access to a subset o=
f the resources through a cluster local address space.=C2=A0The current imp=
lementation always attaches the system memory to the clusters and there is =
no means to isolate access to peripherals. With this patch, I am able to cr=
eate re-mapped aliases to the global address space and attach it as sub-reg=
ions to the application cluster container.=C2=A0This approach also provides=
 a capability to dynamically attach and detach sub-regions at runtime.=C2=
=A0 ---- On Thu, 15 Dec 2022 05:09:53 -0800  bmeng.cn@gmail.com  wrote ----=
On Sun, Dec 11, 2022 at 1:29 PM Vysakh P Pillai
<vysakhpillai@embeddedinn.xyz> wrote:
>
> Add support to optionally specify a memory region container
> to be used to override the default system memory used
> by the the RISCV harts when they are realized. Additional
> memory regions can be added as sub-regions of this container
> to dynamically control the memory regions and mappings visible
> from the hart.

Could you please specify what user case are you trying to address with
this patch?

>
> Signed-off-by: Vysakh P Pillai <vysakhpillai@embeddedinn.xyz>
> ---
>  hw/riscv/riscv_hart.c         | 5 +++++
>  include/hw/riscv/riscv_hart.h | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index 613ea2aaa0..7a8dcab7e7 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -33,6 +33,8 @@ static Property riscv_harts_props[] =3D {
>      DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
>      DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
>                         DEFAULT_RSTVEC),
> +    DEFINE_PROP_UINT64("cpu-memory", RISCVHartArrayState,
> +                       cpu_memory,NULL),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -49,6 +51,9 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, =
int idx,
>      qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec=
);
>      s->harts[idx].env.mhartid =3D s->hartid_base + idx;
>      qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
> +    if (s->cpu_memory) {
> +        object_property_set_link(OBJECT(&s->harts[idx].parent_obj), "mem=
ory",OBJECT(s->cpu_memory), &error_abort);
> +    }
>      return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
>  }
>
> diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.=
h
> index bbc21cdc9a..3e5dfeeaae 100644
> --- a/include/hw/riscv/riscv_hart.h
> +++ b/include/hw/riscv/riscv_hart.h
> @@ -38,6 +38,7 @@ struct RISCVHartArrayState {
>      uint32_t hartid_base;
>      char *cpu_type;
>      uint64_t resetvec;
> +    uint64_t cpu_memory;
>      RISCVCPU *harts;
>  };
>

Regards,
Bin


------=_Part_250202_247026888.1671550026672
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D'font-size:10pt;font-family:Verdana,Arial,Helvetica=
,sans-serif;'><div id=3D"message"></div>In the machine model that I am tryi=
ng to create, there are two CPU clusters. The management cluster has full a=
ccess to the system resources through a global address space while the appl=
ication cluster has access to a subset of the resources through a cluster l=
ocal address space.&nbsp;<div><br></div><div>The current implementation alw=
ays attaches the system memory to the clusters and there is no means to iso=
late access to peripherals. With this patch, I am able to create re-mapped =
aliases to the global address space and attach it as sub-regions to the app=
lication cluster container.&nbsp;</div><div><br></div><div>This approach al=
so provides a capability to dynamically attach and detach sub-regions at ru=
ntime.&nbsp;<br id=3D"br3"><br id=3D"br3"><br id=3D"br3"><div id=3D"signatu=
re"><div><br></div></div><div id=3D"content"><br> ---- On Thu, 15 Dec 2022 =
05:09:53 -0800 <b> bmeng.cn@gmail.com </b> wrote ----<br><br><blockquote st=
yle=3D"border-left: 1px solid rgb(204, 204, 204); padding-left: 6px; margin=
-left: 5px;"><div>On Sun, Dec 11, 2022 at 1:29 PM Vysakh P Pillai
<br>&lt;<a href=3D"mailto:vysakhpillai@embeddedinn.xyz" target=3D"_blank">v=
ysakhpillai@embeddedinn.xyz</a>&gt; wrote:
<br>&gt;
<br>&gt; Add support to optionally specify a memory region container
<br>&gt; to be used to override the default system memory used
<br>&gt; by the the RISCV harts when they are realized. Additional
<br>&gt; memory regions can be added as sub-regions of this container
<br>&gt; to dynamically control the memory regions and mappings visible
<br>&gt; from the hart.
<br>
<br>Could you please specify what user case are you trying to address with
<br>this patch?
<br>
<br>&gt;
<br>&gt; Signed-off-by: Vysakh P Pillai &lt;<a href=3D"mailto:vysakhpillai@=
embeddedinn.xyz" target=3D"_blank">vysakhpillai@embeddedinn.xyz</a>&gt;
<br>&gt; ---
<br>&gt;  hw/riscv/riscv_hart.c         | 5 +++++
<br>&gt;  include/hw/riscv/riscv_hart.h | 1 +
<br>&gt;  2 files changed, 6 insertions(+)
<br>&gt;
<br>&gt; diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
<br>&gt; index 613ea2aaa0..7a8dcab7e7 100644
<br>&gt; --- a/hw/riscv/riscv_hart.c
<br>&gt; +++ b/hw/riscv/riscv_hart.c
<br>&gt; @@ -33,6 +33,8 @@ static Property riscv_harts_props[] =3D {
<br>&gt;      DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type)=
,
<br>&gt;      DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
<br>&gt;                         DEFAULT_RSTVEC),
<br>&gt; +    DEFINE_PROP_UINT64("cpu-memory", RISCVHartArrayState,
<br>&gt; +                       cpu_memory,NULL),
<br>&gt;      DEFINE_PROP_END_OF_LIST(),
<br>&gt;  };
<br>&gt;
<br>&gt; @@ -49,6 +51,9 @@ static bool riscv_hart_realize(RISCVHartArraySta=
te *s, int idx,
<br>&gt;      qdev_prop_set_uint64(DEVICE(&amp;s-&gt;harts[idx]), "resetvec=
", s-&gt;resetvec);
<br>&gt;      s-&gt;harts[idx].env.mhartid =3D s-&gt;hartid_base + idx;
<br>&gt;      qemu_register_reset(riscv_harts_cpu_reset, &amp;s-&gt;harts[i=
dx]);
<br>&gt; +    if (s-&gt;cpu_memory) {
<br>&gt; +        object_property_set_link(OBJECT(&amp;s-&gt;harts[idx].par=
ent_obj), "memory",OBJECT(s-&gt;cpu_memory), &amp;error_abort);
<br>&gt; +    }
<br>&gt;      return qdev_realize(DEVICE(&amp;s-&gt;harts[idx]), NULL, errp=
);
<br>&gt;  }
<br>&gt;
<br>&gt; diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/risc=
v_hart.h
<br>&gt; index bbc21cdc9a..3e5dfeeaae 100644
<br>&gt; --- a/include/hw/riscv/riscv_hart.h
<br>&gt; +++ b/include/hw/riscv/riscv_hart.h
<br>&gt; @@ -38,6 +38,7 @@ struct RISCVHartArrayState {
<br>&gt;      uint32_t hartid_base;
<br>&gt;      char *cpu_type;
<br>&gt;      uint64_t resetvec;
<br>&gt; +    uint64_t cpu_memory;
<br>&gt;      RISCVCPU *harts;
<br>&gt;  };
<br>&gt;
<br>
<br>Regards,
<br>Bin
<br>
<br></div></blockquote></div></div></div><br></body></html>
------=_Part_250202_247026888.1671550026672--


